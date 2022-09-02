package net.koreate.moca.manage.vo;

import lombok.Data;
import net.koreate.moca.reservation.vo.ReservationDTO;

@Data
public class ManageReservationDTO extends ReservationDTO {

	private int participant_count;

}
