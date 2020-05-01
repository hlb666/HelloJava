package com.util;

public class Distance {
		
	public static double HaverSin(double theta)
	{
	    double v = Math.sin(theta / 2);
	    return v * v;
	}
	
	 static double EARTH_RADIUS = 6371.0;
	
	 public static double Distance(double lat1,double lon1, double lat2,double lon2)
     {
         //用haversine公式计算球面两点间的距离。
         //经纬度转换成弧度
         lat1 = ConvertDegreesToRadians(lat1);
         lon1 = ConvertDegreesToRadians(lon1);
         lat2 = ConvertDegreesToRadians(lat2); 
         lon2 = ConvertDegreesToRadians(lon2);

         //差值
         double vLon = Math.abs(lon1 - lon2);
         double vLat = Math.abs(lat1 - lat2);

         //h is the great circle distance in radians, great circle就是一个球体上的切面，它的圆心即是球心的一个周长最大的圆。
         double h = HaverSin(vLat) + Math.cos(lat1) * Math.cos(lat2) * HaverSin(vLon);

         double distance = 2 * EARTH_RADIUS * Math.asin(Math.sqrt(h));

         return distance;
     }
	 
	 
	 public static double ConvertDegreesToRadians(double degrees)
     {
         return degrees * Math.PI / 180;
     }

     public static double ConvertRadiansToDegrees(double radian)
     {
         return radian * 180.0 / Math.PI;
     }

	
}

