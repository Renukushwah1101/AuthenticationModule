package org.renu;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.renu.hibernate.DAO.FileDAO;
import org.renu.hibernate.entity.Files;
import org.renu.send.GenerateQr;
import org.renu.send.SendMail;
import org.renu.send.SendSms;
import org.renu.verify.VerifyQr;

import com.google.zxing.NotFoundException;
import com.google.zxing.WriterException;

@WebServlet("/Operation")

@MultipartConfig
public class OperationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String otpString;
	String phone1;
	String email3;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		page = page.toLowerCase();

		switch (page) {

		case "forget_verifyqr":
			forget_verifyqr(request, response);
			break;

		case "forget_verifyotp":
			forget_verifyotp(request, response);
			break;
		case "forgetpassword":
			forgetPassword(request, response);
			break;

		case "registration":
			registrationMethod(request, response);
			break;

		default:
			errorPage(request, response);
			break;

		}
	}

	private void forget_verifyqr(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "forget_verifyqr");
		request.getRequestDispatcher("forget_verifyqr.jsp").forward(request, response);

	}

	private void forget_verifyotp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "forget_verifyotp");
		request.getRequestDispatcher("forget_verifyotp.jsp").forward(request, response);

	}

	private void forgetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "RegisterPage");
		request.getRequestDispatcher("forget.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String form = request.getParameter("form");
		form = form.toLowerCase();

		switch (form) {
		case "login":
			login(request, response);
			break;
		case "updatepasswordno":
			updatePasswordNo(request, response);
			break;
		case "updatepasswordmail":
			updatePasswordEmail(request, response);
			break;
		case "verifyotp":
			verifyOtp(request, response);

			break;

		case "register":

			try {
				register(request, response);
			} catch (NotFoundException e1) {
				e1.printStackTrace();
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (WriterException e1) {
				e1.printStackTrace();
			}

			break;

		case "verifyqrcode":
			try {
				verifyQrCode(request, response);
			} catch (NotFoundException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (WriterException e1) {
				e1.printStackTrace();
			}
			break;

		case "qr":

			String name = request.getParameter("name");
			String email3 = request.getParameter("email");

			try {
				sendQr(request, response, email3, name);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "qrcode":
			String email2 = request.getParameter("email");
			try {
				getQrName(request, response, email2);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "sendotp":
			phone1 = request.getParameter("phone");
			sendOtp(request, response, phone1);
			break;
		default:
			errorPage(request, response);
			break;

		}
	}

	private void updatePasswordEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("con_password");
		System.out.println("in method");
		new FileDAO().updatePasswordThroughMail(email3, password);
		request.setAttribute("title", "passwordUpdated");
		request.getRequestDispatcher("passwordUpdated.jsp").forward(request, response);

	}

	private void updatePasswordNo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String password = request.getParameter("con_password");
		System.out.println("in method");
		new FileDAO().updatePasswordThroughNo(phone1, password);
		request.setAttribute("title", "passwordUpdated");
		request.getRequestDispatcher("passwordUpdated.jsp").forward(request, response);

	}

	private void verifyOtp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String enotp = request.getParameter("enotp");
		if (otpString.compareTo(enotp) == 0) {
			System.out.println("otp verified");
			request.setAttribute("title", "enterPassword");
			request.getRequestDispatcher("enterPasswordNo.jsp").forward(request, response);
		} else {
			request.setAttribute("title", "Registration Fail");
			request.getRequestDispatcher("registrationFail.jsp").forward(request, response);
		}
	}

	private void verifyQrCode(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, NotFoundException, WriterException {
		email3 = request.getParameter("email");

		Part part = request.getPart("file");
		System.out.println("part name " + part);
		String fileName = extractFileName(part);
		System.out.println("filename" + fileName);

		String savePath = "C:\\Users\\kushwah\\eclipse-workspace\\AuthenticationModule\\WebContent\\qrcodes\\"
				+ File.separator + fileName;
		System.out.println("savePath: " + savePath);

		File fileSaveDir1 = new File(savePath);

		System.out.println(fileName);
		part.write(savePath + File.separator);
		VerifyQr vqr = new VerifyQr();
		String verifiedEmail = vqr.verifyQr(savePath);
		System.out.println("verified" + verifiedEmail);
		if (email3.compareTo(verifiedEmail) == 0) {
			request.setAttribute("title", "enterPassword");
			part.delete();
			request.getRequestDispatcher("enterPasswordMail.jsp").forward(request, response);
		} else {
			request.setAttribute("title", "Registration Fail");
			part.delete();
			request.getRequestDispatcher("registrationFail.jsp").forward(request, response);
		}

	}

	private void getQrName(HttpServletRequest request, HttpServletResponse response, String email)
			throws IOException, Exception {
		String name = null;
		List<Files> fil = new FileDAO().resultout(email);
		for (Files file : fil) {
			name = file.getName();
			System.out.println(file.getName());
		}
		sendQr(request, response, email, name);

	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email1 = request.getParameter("email1");
		String password1 = request.getParameter("password1");
		String match = null;
		List<Files> fil = new FileDAO().resultout(email1);
		for (Files file : fil) {
			match = file.getPassword();
			System.out.println(file.getPassword());
		}
		if (password1.compareTo(match) == 0) {
			request.setAttribute("title", "LoginSuccessfulPage");
			request.getRequestDispatcher("loginSuccessful.jsp").forward(request, response);

		} else {
			request.setAttribute("title", "Registration Fail");
			request.getRequestDispatcher("registrationFail.jsp").forward(request, response);

		}
	}

	private void sendQr(HttpServletRequest request, HttpServletResponse response, String email, String name)
			throws IOException, Exception {
		GenerateQr gen = new GenerateQr();

		File file = gen.qrCode(email, name);

		System.out.println("prepare to send message");

		String message = "Hello This message for Authentication ";
		String subject = "Authentication : Confirmation";

		String from = "kushwahrenu786@gmail.com";
		SendMail qr = new SendMail();
		qr.sendAttach(message, subject, email, from, file);

	}

	public void sendOtp(HttpServletRequest request, HttpServletResponse response, String phone) {

		int randomPin = (int) (Math.random() * 9000) + 1000;

		otpString = String.valueOf(randomPin);
		System.out.println("your otp is  : " + otpString);
		System.out.println("Program started.....");
		SendSms send = new SendSms();
		send.sendSms(otpString, phone);

	}

	public void registrationMethod(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "RegisterPage");
		request.getRequestDispatcher("registration.jsp").forward(request, response);

	}

	public void errorPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "errorPage");
		request.getRequestDispatcher("error.jsp").forward(request, response);

	}

	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NotFoundException, WriterException {

		String name = request.getParameter("name");
		String enotp = request.getParameter("enotp");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("con_password");
		System.out.println("name is " + name);
		System.out.println(enotp);

		System.out.println(phone);

		System.out.println(email);

		System.out.println(password);

		System.out.println(request.getParameter("file"));

		Part part = request.getPart("file");//
		System.out.println("part name " + part);
		String fileName = extractFileName(part);// file name
		System.out.println("filename" + fileName);

		String savePath = "C:\\Users\\kushwah\\eclipse-workspace\\AuthenticationModule\\WebContent\\qrcodes\\"
				+ File.separator + fileName;
		System.out.println("savePath: " + savePath);

		File fileSaveDir1 = new File(savePath);

		System.out.println(fileName);
		part.write(savePath + File.separator);
		VerifyQr vqr = new VerifyQr();
		String verifiedEmail = vqr.verifyQr(savePath);
		System.out.println("verified" + verifiedEmail);
		System.out.println(otpString);
		if (otpString.compareTo(enotp) == 0) {
			System.out.println("otp verified");
			if (email.compareTo(verifiedEmail) == 0) {
				Files file = new Files(phone, email, password, name);

				new FileDAO().addFileDetails(file);
				request.setAttribute("title", "Registered");
				part.delete();
				request.getRequestDispatcher("register.jsp").forward(request, response);

			}
		} else {

			request.setAttribute("title", "Registration Fail");
			part.delete();
			request.getRequestDispatcher("registrationFail.jsp").forward(request, response);
		}

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}