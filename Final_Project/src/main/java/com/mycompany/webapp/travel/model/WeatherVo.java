package com.mycompany.webapp.travel.model;

public class WeatherVo {
	 private int locationCode;
	    private String date; // 날짜
	    private String time; // 시간
	    private double rainState; // 강수 형태
	    private double humid; // 습도
	    private double rainAmount; // 1시간 강수량
	    private double temp; // 기온
	    private double windDir; // 풍향
	    private double windSpd; // 풍속
	    
	    
		public int getLocationCode() {
			return locationCode;
		}
		public void setLocationCode(int locationCode) {
			this.locationCode = locationCode;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getTime() {
			return time;
		}
		public void setTime(String time) {
			this.time = time;
		}
		public double getRainState() {
			return rainState;
		}
		public void setRainState(double rainState) {
			this.rainState = rainState;
		}
		public double getHumid() {
			return humid;
		}
		public void setHumid(double humid) {
			this.humid = humid;
		}
		public double getRainAmount() {
			return rainAmount;
		}
		public void setRainAmount(double rainamount) {
			this.rainAmount = rainamount;
		}
		public double getTemp() {
			return temp;
		}
		public void setTemp(double temp) {
			this.temp = temp;
		}
		public double getWindDir() {
			return windDir;
		}
		public void setWindDir(double windDir) {
			this.windDir = windDir;
		}
		public double getWindSpd() {
			return windSpd;
		}
		public void setWindSpd(double windSpd) {
			this.windSpd = windSpd;
		}
		@Override
		public String toString() {
			return "Weather [locationCode=" + locationCode + ", date=" + date + ", time=" + time + ", rainState="
					+ rainState + ", humid=" + humid + ", rainamount=" + rainAmount + ", temp=" + temp + ", windDir="
					+ windDir + ", windSpd=" + windSpd + "]";
		}
		
	    
	    
	    
	    
	    
}
