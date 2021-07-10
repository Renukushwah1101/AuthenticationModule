package org.renu.send;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

public class SendSms {

	public void sendSms(String message, String number) {

		try {
			String apiKey = "5g4A3xWa6dYwZ82CXo0BIOmFvMjKzhG9fbUVyRLuPDlQeT1ksJW2HuVyQsT7eNmoEMCDk5PG9IlqOir4";

			String sendId = "CHKSMS";

			message = URLEncoder.encode(message, "UTF-8");
			String language = "english";
			String route = "q";
			int flash = 0;
			String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&sender_id=" + sendId
					+ "&message=" + message + "&language=" + language + "&route=" + route + "&flash=" + flash
					+ "&numbers=" + number;
			URL url = new URL(myUrl);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("cache-control", "no-cache");
			System.out.println("Wait..............");
			int code = con.getResponseCode();
			System.out.println("Response code : " + code);
			StringBuffer response = new StringBuffer();
			System.out.println(message);
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			while (true) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				response.append(line);
			}
			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
