package com.ftf.common;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import com.swetake.util.Qrcode;

public class QRCodeUtils {
	  public void encoderQRCoder(String content, HttpServletResponse response) {  
	        try {  
	            Qrcode handler = new Qrcode();  
	            handler.setQrcodeErrorCorrect('M');  
	            handler.setQrcodeEncodeMode('B');  
	            handler.setQrcodeVersion(7);  	              
	            System.out.println(content);  
	            byte[] contentBytes = content.getBytes("UTF-8");  	              
	            BufferedImage bufImg = new BufferedImage(140,140, BufferedImage.TYPE_INT_RGB);  
	            Graphics2D gs = bufImg.createGraphics();  	              
	            gs.setBackground(Color.WHITE);  
	            gs.clearRect(0, 0, 140, 140);  
	              
	            //设定图像颜色：BLACK  
	            gs.setColor(Color.BLACK);  
	              
	            //设置偏移量  不设置肯能导致解析出错  
	            int pixoff = 2;  
	            //输出内容：二维码  
	            if(contentBytes.length > 0 && contentBytes.length < 124) {  
	                boolean[][] codeOut = handler.calQrcode(contentBytes);  
	                for(int i = 0; i < codeOut.length; i++) {  
	                    for(int j = 0; j < codeOut.length; j++) {  
	                        if(codeOut[j][i]) {  
	                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff,3, 3);  
	                        }  
	                    }  
	                }  
	            } else {  
	                System.err.println("QRCode&nbsp;content&nbsp;bytes&nbsp;length&nbsp;=&nbsp;" + contentBytes.length + "&nbsp;not&nbsp;in&nbsp;[&nbsp;0,120&nbsp;].&nbsp;");  
	            }  	              
	            gs.dispose();  
	            bufImg.flush();  	              	              	              
	            //生成二维码QRCode图片  
	            ImageIO.write(bufImg, "jpg", response.getOutputStream());  	           	              
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    }  
}
