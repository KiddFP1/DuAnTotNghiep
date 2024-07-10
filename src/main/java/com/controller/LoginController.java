package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.constant.sessionAttr;
import com.model.DiaChi_TaiKhoan;
import com.model.GioHang;
import com.model.Quyen;
import com.model.Quyen_TaiKhoan;
import com.model.TaiKhoan;
import com.repository.DiaChi_TaiKhoanDAO;
import com.repository.GioHangDAO;
import com.repository.QuyenDAO;
import com.repository.Quyen_TaiKhoanDAO;
import com.repository.TaiKhoanDAO;
import com.service.CookieService;
import com.service.ParamService;
import com.service.SessionService;
import com.service.SessionService_quenMatKhau;
import com.service.impl.MailerServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    SessionService sessionService;

    @Autowired
    ParamService paramService;

    @Autowired
    CookieService cookieService;
    @Autowired
    TaiKhoanDAO taiKhoanDao;

    @Autowired
    Quyen_TaiKhoanDAO quyenTKDao;

    @Autowired
    GioHangDAO giohangDao;

    @Autowired
    QuyenDAO quyenDao;

    @Autowired
    HttpSession hSession;

    @Autowired
    MailerServiceImpl mailer;

    @Autowired
    DiaChi_TaiKhoanDAO dctkDAO;

    @Autowired
    SessionService_quenMatKhau sessionService_quenmatkhau;

    @GetMapping("shop/auth/login")
    public String login(Model model) {
        return "shop/login";
    }

    @GetMapping("shop/auth/register")
    public String dangkytaikhoan(Model model) {
        return "/shop/register";
    }

    @GetMapping("shop/auth/forgot-password")
    public String quenmatkhau(Model model) {
        return "/shop/forgot-password";
    }

    @GetMapping("shop/auth/set-new-password")
    public String datlaimatkhaumoi(Model model) {
        return "/shop/new-password";
    }

    public static String generateRandomString(Integer length) {
        if (length == null) {
            throw new IllegalArgumentException("Length must not be null");
        }
        String characters = "0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(characters.length());
            char randomChar = characters.charAt(index);
            sb.append(randomChar);
        }

        return sb.toString();
    }

    String randomString = generateRandomString(10);
    String Subject = "███ Shop Phụ Kiện Trực Tuyến Xin Chào, Đây là mã xác nhận của bạn ███";
    String icon1 = "Mã xác nhận email của bạn là: <h>&#x1F338;<strong>" + randomString + "</strong> &#x1F338;</h>\n";

    @RequestMapping("sendemail/{email}")
    public String sendemail(Model model, @PathVariable("email") String email) {
        sessionService_quenmatkhau.set("maxacnhan_email", randomString);
        String styledIcon1 = icon1.replace("\n", "<br>");
        model.addAttribute("email", email);
        mailer.send(email, Subject, styledIcon1);
        return "shop/forgot-password-code";
    }

    @RequestMapping("kiemtraemail")
    public String kiemtraemail(
            Model model,
            @RequestParam("email") String email,
            @RequestParam("tendangnhap") String tendangnhap) {
        if (tendangnhap.equals("")) {
            model.addAttribute("kiemtratendangnhap", "<<<  Vui lòng nhập tên đăng nhập  >>>");
            return "shop/forgot-password";
        }

        if (email.equals("")) {
            model.addAttribute("kiemtramail", "<<<  Vui lòng nhập email  >>>");
            return "shop/forgot-password";
        }

        TaiKhoan kiemtramail = taiKhoanDao.findByEmail(email);

        if (kiemtramail == null) {
            model.addAttribute("kiemtramail", "<<<  Email không tồn tại  >>>");
            return "shop/forgot-password";
        }

        // Check if the provided email corresponds to the entered username
        TaiKhoan foundUser = taiKhoanDao.findByTenDangNhapAndEmail(tendangnhap, email);

        if (foundUser == null) {
            model.addAttribute("kiemtratendangnhap", "<<<  Email không tương ứng với tên đăng nhập  >>>");
            return "shop/forgot-password";
        }

        return "redirect:/sendemail/" + email;
    }

    String emailthaydoimatkhau = "";

    @RequestMapping("xacnhanma/{email}")
    public String xacnhanma(Model model, @PathVariable("email") String email,
            @RequestParam("maxacnhan") String maxacnhan) {
        if (maxacnhan.equals("")) {
            model.addAttribute("kiemtramaxacnhan", "<<<  Vui lòng nhập mã xác nhận!  >>>");
            model.addAttribute("email", email);
            return "shop/quenmatkhau_xacnhanma";
        } else if (!maxacnhan.equals(sessionService_quenmatkhau.get("maxacnhan_email"))) {
            model.addAttribute("kiemtramaxacnhan", "<<<  Mã xác nhận không hợp lệ!  >>>");
            model.addAttribute("email", email);
            return "shop/forgot-password-code";
        }
        emailthaydoimatkhau = email;
        return "redirect:/thaydoimatkhau";
    }

    String thongbaothaydoimatkhau_tendangnhap = "";
    String thongbaothaydoimatkhau_matkhau = "";
    String matk = "";

    @RequestMapping("thaydoimatkhau")
    public String thaydoimatkhau(Model model) {
        TaiKhoan kiemTraTaiKhoanEmail = taiKhoanDao.findByEmail(emailthaydoimatkhau);
        model.addAttribute("tenDangNhap", kiemTraTaiKhoanEmail.getTenDangNhap());
        model.addAttribute("email", emailthaydoimatkhau);
        model.addAttribute("thongbaothaydoimatkhau_tendangnhap", thongbaothaydoimatkhau_tendangnhap);
        model.addAttribute("thongbaothaydoimatkhau_matkhau", thongbaothaydoimatkhau_matkhau);
        model.addAttribute("matk", matk);
        return "shop/new-password";
    }

    String Subject1 = "███ SHOP XIN CHÀO, ĐÂY LÀ MÃ XÁC NHẬN CỦA BẠN ███";
    String icon11 = ""
            + "Mã xác nhận email của bạn là: <h>" + randomString + "</h>\n";

    @RequestMapping("xacnhanthaydoimatkhau/{email}")
    public String xacnhanthaydoimatkhau(
            Model model,
            @PathVariable("email") String email,
            @RequestParam("matKhau") String matKhau,
            @RequestParam("xacnhanmatkhau") String xacNhanMatKhau) {

        // Regular expressions for password validation
        TaiKhoan kiemTraTaiKhoanEmail = taiKhoanDao.findByEmail(email);
        kiemTraTaiKhoanEmail.setMatKhau(matKhau);
        taiKhoanDao.save(kiemTraTaiKhoanEmail);
        return "shop/login";
    }

    @PostMapping("dangnhap")
    public String dangNhap(RedirectAttributes redAttr, Model model, HttpServletRequest req) {
        String un = req.getParameter("tenDangNhap");
        String pw = req.getParameter("matKhau");
        TaiKhoan tk = taiKhoanDao.findByTenTaiKhoanThongThuong(un, pw);
        TaiKhoan checkactive = taiKhoanDao.findByTenTaiKhoan(un);
        // boolean rm = paramService.getBoolean("remember", false);
        if (un.equals("") || pw.equals("")) {
            model.addAttribute("error", "Không để trống thông tin!");
            return "/shop/login";
        } else {
            if (!checkactive.getActive()) {
                 redAttr.addFlashAttribute("error", "Tài khoản đã bị khóa! ");
                    return "redirect:/shop/auth/login";
            } else {
                try {
                    if (un.equalsIgnoreCase(tk.getTenDangNhap()) && pw.equals(tk.getMatKhau())) {
                        model.addAttribute("message", "Đăng nhập thành công!");
                        hSession.setAttribute(sessionAttr.CURRENT_USER, tk);
                        System.out.println(hSession.getAttribute(sessionAttr.CURRENT_USER));
                        System.out.println("Đăng nhập thành công!");
                        Quyen_TaiKhoan quyentk = quyenTKDao.findbyTenDangNhap(tk.getTenDangNhap());
                        switch (quyentk.getQuyen().getId()) {
                            case "CUST":
                                System.err.println("khach hang");
                                hSession.setAttribute(sessionAttr.CUST, quyentk);
                                break;
                            case "MANA":
                                System.err.println("Quan tri vien");
                                hSession.setAttribute(sessionAttr.MANA, quyentk);
                                break;
                            case "STAF":
                                System.err.println("Cong tac vien");
                                hSession.setAttribute(sessionAttr.STAFF, quyentk);
                                break;
                            default:
                                System.err.println("Khach Hang");
                                hSession.setAttribute(sessionAttr.CUST, quyentk);
                                break;
                        }
                        return "redirect:/home";
                    }
                } catch (Exception e) {
                    redAttr.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không đúng!");
                    return "redirect:/shop/auth/login";
                }
            }

        }
        return "shop/login";
    }

    public boolean isPasswordValid(HttpServletRequest req, Model model) {

        String password = req.getParameter("matKhau");
        String password2 = req.getParameter("xacNhanMK");

        if (kiemTraChuoi(password)) {
            if (password.equals(password2)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static boolean kiemTraChuoi(String chuoi) {
        // Kiểm tra xem chuỗi có ít nhất 8 kí tự không
        

        // Kiểm tra xem chuỗi có chứa ít nhất một kí tự viết hoa không
        

        // Kiểm tra xem chuỗi có chứa ít nhất một kí tự viết thường không
        // Kiểm tra xem chuỗi có chứa ít nhất một số không
        if ((chuoi.length() < 8) || !chuoi.matches(".*[A-Z].*") || !chuoi.matches(".*[a-z].*") || !chuoi.matches(".*\\d.*")) {
            return false;
        }

        if (!chuoi.matches(".*[!@#$%^&*(),.?\":{}|<>].*")) {
            return false;
        }

        // Kiểm tra xem chuỗi có chứa ít nhất một kí tự đặc biệt không (tùy chọn)
        // Nếu bạn muốn yêu cầu kí tự đặc biệt, hãy thêm ".*[!@#$%^&*(),.?\":{}|<>].*"
        // vào điều kiện

        // Nếu chuỗi vượt qua tất cả các kiểm tra, trả về true
        return true;
    }

    public static boolean EmailValidation(HttpServletRequest req) {
        String regexPattern = "^(.+)@(\\S+)$";
        String email = req.getParameter("email");
        Pattern pattern = Pattern.compile(regexPattern);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    @PostMapping("dangky")
    public String dangKy(Model model, HttpServletRequest req, RedirectAttributes red) {
        String tenDangNhap = req.getParameter("username");
        String matKhau = req.getParameter("matKhau");
        String xacNhanMK = req.getParameter("xacNhanMK");
        String email = req.getParameter("email");

        TaiKhoan timtaiKhoan = taiKhoanDao.findByTenTaiKhoan(tenDangNhap);
        TaiKhoan timEmail = taiKhoanDao.findByEmail(email);

        if (tenDangNhap.equals("") || matKhau.equals("") || xacNhanMK.equals("") || email.equals("")) {
            System.out.println("Không được để trống");
            model.addAttribute("error", "Không được để trống");
            return "shop/register";
        } else {
            if (timtaiKhoan != null) {
                System.out.println("tai khoan da duoc su dung");
                model.addAttribute("error", "Tài Khoản đã được sử dụng");
                return "shop/register";
            } else {
                if (timEmail != null) {
                    System.out.println("email da ton tai");
                    model.addAttribute("error", "Email đã tồn tại");
                    return "shop/register";
                } else {
                    if (!matKhau.equalsIgnoreCase(xacNhanMK)) {
                        System.out.println("mat khau khong trung khop");
                        model.addAttribute("error", "Mật khẩu không trùng khớp");
                        return "shop/register";
                    } else {
                        if (!isPasswordValid(req, model)) {
                            System.out.println("Mat khau sai dinh dang");
                            model.addAttribute("error",
                                    "Mật khẩu phải bao gồm chữ hoa, chữ thường, số và ít nhất 1 ký tự đặc biệt");
                            return "shop/register";
                        } else {
                            if (!EmailValidation(req)) {
                                System.out.println("sai dinh dang mail");
                                model.addAttribute("error", "Email sai định dạng");
                                return "shop/register";
                            } else {
                                TaiKhoan themTaiKhoan = new TaiKhoan();
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                String dateString = "2000-01-01";
                                // System.out.println(quyen);
                                themTaiKhoan.setTenDangNhap(tenDangNhap);
                                themTaiKhoan.setMatKhau(matKhau);
                                themTaiKhoan.setHoTen(tenDangNhap);
                                themTaiKhoan.setEmail(email);
                                try {
                                    Date date = dateFormat.parse(dateString);
                                    themTaiKhoan.setNgaySinh(date);
                                } catch (ParseException e) {
                                    e.printStackTrace(); // Handle the ParseException appropriately
                                }
                                themTaiKhoan.setActive(true);
                                taiKhoanDao.save(themTaiKhoan);
                                // them dia chi
                                DiaChi_TaiKhoan dctk = new DiaChi_TaiKhoan();
                                dctk.setTaiKhoan_diaChi(themTaiKhoan);
                                dctk.setHoTen(themTaiKhoan.getTenDangNhap());
                                dctk.setDiaChi("Chưa có địa chỉ");
                                dctk.setMacDinh(true);
                                dctkDAO.save(dctk);
                                // them quyen
                                Quyen quyen = quyenDao.findById("CUST").get();
                                Quyen_TaiKhoan qTK = new Quyen_TaiKhoan();
                                qTK.setQuyen(quyen);
                                qTK.setTaiKhoan_quyen(themTaiKhoan);
                                quyenTKDao.save(qTK);
                                System.out.println(qTK);

                                GioHang taogiohang = new GioHang();
                                taogiohang.setTaiKhoan_gioHang(themTaiKhoan);
                                giohangDao.save(taogiohang);
                                red.addFlashAttribute("message", "Đăng ký tài khoản thành công");
                                return "redirect:/shop/auth/login";
                            }

                        }
                    }
                }
            }
        }

    }

    @GetMapping("/shop/auth/logout")
    public String logOut() {
        hSession.removeAttribute(sessionAttr.CUST);
        hSession.removeAttribute(sessionAttr.MANA);
        hSession.removeAttribute(sessionAttr.STAFF);
        hSession.removeAttribute(sessionAttr.CURRENT_USER);
        return "redirect:/shop/home";
    }
}
