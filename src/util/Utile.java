package util;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;


public class Utile {
	public static Date getDate(LocalDate localDate){
		if(localDate == null) return null;
		Instant instant = Instant.from(localDate.atStartOfDay(ZoneId.systemDefault()));
		return Date.from(instant);
	}
	public static LocalDate getLocalDate(Date date){
		if(date == null) return null;
		LocalDate localDate = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault()).toLocalDate();
		return localDate;
	}
	public static String formatNumber(int number){
		String nb = String.valueOf(number);
		for(int i = nb.length(); i<4; i++)
			nb = '0'+nb;
		return nb;
	}

}
