package org.renu.verify;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class VerifyQr {
	@SuppressWarnings("unused")
	public String verifyQr(String path) throws WriterException, IOException, NotFoundException {

		String charset = "UTF-8";
		Map<EncodeHintType, ErrorCorrectionLevel> hintMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
		// generates QR code with Low level(L) error correction capability
		hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
		BinaryBitmap binaryBitmap = new BinaryBitmap(
				new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new FileInputStream(path)))));
		Result rslt = new MultiFormatReader().decode(binaryBitmap);
		return rslt.getText();

	}
}
