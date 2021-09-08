package global.sesoc.music.vo;

import lombok.Data;

/**
 * 음반정보 VO
 */
@Data
public class MusicVO {
	
	   private int cdnum;
	   private String artist;
	   private String title;
	   private int price;
}
