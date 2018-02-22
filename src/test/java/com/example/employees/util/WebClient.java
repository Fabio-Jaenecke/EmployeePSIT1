package com.example.employees.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.logging.Logger;

/**
 * WebClient class for servlet integration test
 *   Byte[] byteResponse = webClient.get(url);
 *   String response = webClient.convertToString(byteResponse);
 *
 */

public class WebClient {

	private  final int FIRST_HTTP_ERROR_CODE = 400;
	private  final int BUF_SIZE = 2048;
	private  final int HTTP_NOT_FOUND = 404;
	private  final String HTTP_GET = "GET";
	private  final String HTTP_POST = "POST";
	private  final String HTTP_PUT = "PUT";
	private  final String HTTP_DELETE = "DELETE";
	private  final static String ENCODING = "UTF-8";
	private  final int CONNECT_TIMEOUT = 10000;
	private  final int READ_TIMEOUT = 60000;
	private  final String USER_AGENT = "X-United";

	final  Logger LOGGER = Logger.getLogger(this.getClass().getSimpleName());

	private  String contentType = "application/x-www-form-urlencoded"; // 	"application/json";


	public byte[] get(final String url)
			throws IOException {

		final HttpURLConnection connection = prepareConnection(new URL(url), HTTP_GET);

		LOGGER.fine("Service status response: " + 
				connection.getResponseCode() + " : " + 
				connection.getResponseMessage() + "");

		if (connection.getResponseCode() == HTTP_NOT_FOUND) {
			return null;
		}

		if (isError(connection)) {
			try (InputStream inputStream = connection.getErrorStream()) {
				final byte[] result = readToByteArray(inputStream);
				throw new ServiceException("Service error response: code=" + connection.getResponseCode() + ", data=" +
						new String(result, ENCODING));
			}
		}

		try (InputStream inputStream = connection.getInputStream()) {
			final byte[] data = readToByteArray(inputStream);
			//				if (LOG.isDebugEnabled()) {
			//					final String msg;
			//					if (!isBinaryContent(connection)) {
			//						msg = new String(data, ENCODING);
			//					} else {
			//						msg = "[binary]";
			//					}
			//					LOG.debug("Service response: {}", msg);
			//				}
			return data;
		}
	}

	private boolean isError(final HttpURLConnection connection) throws IOException {
		return connection.getResponseCode() >= FIRST_HTTP_ERROR_CODE;
	}

	@SuppressWarnings("unused")
	private boolean isBinaryContent(final HttpURLConnection connection) {
		return connection.getContentType().startsWith("image/");
	}


	public byte[] post(final String url, final byte[] data)
			throws IOException {

		return sendAndReceive(url, data, HTTP_POST);
	}

	public byte[] put(final String url,  final byte[] data)
			throws IOException {

		return sendAndReceive(url, data, HTTP_PUT);
	}

	private byte[] sendAndReceive(final String url, final byte[] data, final String type) throws IOException {

		final HttpURLConnection connection = prepareConnection(new URL (url), type);
		connection.setRequestProperty("Content-Type", contentType);
		connection.setDoOutput(true);

		if (data != null) {
			LOGGER.finest("Service request: " + new String(data, ENCODING));
		}

		connection.setRequestProperty("Content-Length", "" + data.length);

		try (final OutputStream outputStream = connection.getOutputStream()) {
			outputStream.write(data);
		}

		LOGGER.fine("Service status response: " + 
				connection.getResponseCode() + ", " + 
				connection.getResponseMessage());

		if (isError(connection)) {
			try (InputStream inputStream = connection.getErrorStream()) {
				final byte[] result = readToByteArray(inputStream);
				if (result.length > 0) {
					throw new ServiceException("Service error response: code=" + connection.getResponseCode() +
							", data=" + new String(result, ENCODING));
				}
			}
		}

		try (InputStream inputStream = connection.getInputStream()) {
			final byte[] result = readToByteArray(inputStream);
			if (result.length > 0 ) {
				LOGGER.fine("Service response: " +  new String(result, ENCODING));
			}
			return result;
		}
	}

	private  byte[] readToByteArray(final InputStream inputStream) throws IOException {
		final ByteArrayOutputStream bos = new ByteArrayOutputStream();

		final byte[] buf = new byte[BUF_SIZE];
		int cnt;
		while ((cnt = inputStream.read(buf)) != -1) {
			bos.write(buf, 0, cnt);
		}

		return bos.toByteArray();
	}

	@SuppressWarnings("unused")
	private  String readToString(InputStream in) throws IOException {
		StringBuilder sb = new StringBuilder();
		BufferedReader r = new BufferedReader(new InputStreamReader(in), 1000);
		for (String line = r.readLine(); line != null; line = r.readLine()) {
			sb.append(line);
		}
		in.close();
		return sb.toString();
	}


	public void delete(final String url) throws IOException {
		final HttpURLConnection connection = prepareConnection(new URL(url), HTTP_DELETE);

		LOGGER.fine("Service status response: " +  
				connection.getResponseCode() + ", " + 
				connection.getResponseMessage());

		if (isError(connection)) {
			try (InputStream inputStream = connection.getErrorStream()) {
				final byte[] result = readToByteArray(inputStream);
				throw new ServiceException("Service error response: " + 
						new String(result, ENCODING));
			}
		}
	}

	private HttpURLConnection prepareConnection(final URL url, final String type) throws IOException {
		final HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		connection.setConnectTimeout(CONNECT_TIMEOUT);
		connection.setReadTimeout(READ_TIMEOUT);
		connection.setRequestProperty("Accept", contentType);
		connection.setRequestProperty("User-Agent", USER_AGENT);
		connection.setRequestMethod(type);

		LOGGER.fine("HTTP request: " + type + ", " + url);

		return connection;
	}

	public byte[] convertToBytes (String data){
		try {
			return data.getBytes(ENCODING);
		} catch (UnsupportedEncodingException e) {
			throw new ServiceException("Service unsupported encoding: " );
		}
	}

	public String convertToString (byte[] data)  {

		try {
			return new String(data, ENCODING);
		} catch (UnsupportedEncodingException e) {
			throw new ServiceException("Service unsupported encoding: " );
		}
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


}




