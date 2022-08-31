package net.koreate.moca.reservation.vo;

import lombok.Data;
import net.koreate.moca.cafe.vo.CafeVO;

@Data
public class CafeDTO extends CafeVO {

	private double star; // 평균 별 개수
	private String onsale; // 세일 중인지 표시

}
