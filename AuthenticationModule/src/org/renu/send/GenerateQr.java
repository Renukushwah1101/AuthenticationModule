package org.renu.send;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class GenerateQr {

	@SuppressWarnings("deprecation")
	public File qrCode(String email, String name) throws IOException, WriterException {
		String path = "E:\\" + name + ".png";
		System.out.println(email);
		System.out.println(name);
		System.out.println("in gen");
		String charset = "UTF-8";
		Map<EncodeHintType, ErrorCorrectionLevel> hashmap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();

		hashmap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

		BitMatrix matrix = new MultiFormatWriter().encode(new String(email.getBytes(charset), charset),
				BarcodeFormat.QR_CODE, 200, 200);
		MatrixToImageWriter.writeToFile(matrix, path.substring(path.lastIndexOf('.') + 1), new File(path));

		System.out.println("Qr code Created");
		File file = new File(path);
		return file;

	}

}
