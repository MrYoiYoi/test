package global.sesoc.music.vo;

import lombok.Data;

/**
 * 구매 처리, 내 구매내역, 판매실적에 사용할 VO
 */
@Data
public class SalesVO {
	
	   private String userid;
	   private int cdnum;
	   private int quantity;
	   private int amount;
	   private String saledate;
	   private int price;
	   private String artist;
	   private String title;
	   private int totalQuantity;
}
