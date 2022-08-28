package net.koreate.moca.invitation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import net.koreate.moca.invitation.service.InvitationService;
import net.koreate.moca.invitation.vo.ChatVO;
import net.koreate.moca.invitation.vo.InvParticipantVO;
import net.koreate.moca.invitation.vo.InvitationVO;
import net.koreate.moca.member.vo.MemberVO;

@RestController
@RequestMapping("/invitation/api/*")
@RequiredArgsConstructor
public class InvitationRestController {

	private final InvitationService is;

	@GetMapping("listByMember/{no}")
	public ResponseEntity<List<InvitationVO>> findByMember(@PathVariable("no") int member_no) {
		ResponseEntity<List<InvitationVO>> entity = null;

		try {
			entity = new ResponseEntity<>(is.findByMember(member_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("listByCode/{no}")
	public ResponseEntity<List<InvParticipantVO>> findByCode(@PathVariable("no") int no) {
		ResponseEntity<List<InvParticipantVO>> entity = null;

		try {
			entity = new ResponseEntity<>(is.findByCode(no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@GetMapping("chat/{no}")
	public ResponseEntity<List<ChatVO>> getChat(@PathVariable("no") int no, HttpSession session) {
		ResponseEntity<List<ChatVO>> entity = null;

		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		if (member != null) {
			try {
				InvitationVO inv = is.findByNo(no);
				if (inv != null) {
					if (inv.getMember_no() == member.getNo()) {
						// 1) 내가 보낸 초대일 때
						List<ChatVO> chatList = is.getChatList(no);
						entity = new ResponseEntity<>(chatList, HttpStatus.OK);
					} else {
						// 2) 내가 받은 초대일 때
						List<InvParticipantVO> partList = is.findByCode(no);
						for (InvParticipantVO ip : partList) {
							if (ip.getParticipant_no() == member.getNo() && ip.getIsAccepted() != null
									&& ip.getIsAccepted() == true) {
								List<ChatVO> chatList = is.getChatList(no);
								entity = new ResponseEntity<>(chatList, HttpStatus.OK);
								break;
							}
						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	}

	@PostMapping("/")
	public ResponseEntity<String> regist(InvitationVO vo) {
		ResponseEntity<String> entity = null;

		try {
			is.regist(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@PostMapping(value = "sendInvite", produces = "text/plain; charset=utf8")
	public ResponseEntity<String> sendInvite(int no, String id, HttpSession session) {
		ResponseEntity<String> entity = null;

		System.out.println(no + " : " + id);
		try {
			entity = new ResponseEntity<>(is.sendInvite(no, id, session.getAttribute("memberInfo")), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@PatchMapping("participant/accept")
	public ResponseEntity<String> acceptInvite(int inv_no, int participant_no) {
		ResponseEntity<String> entity = null;

		try {
			is.acceptInvite(inv_no, participant_no);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@PatchMapping("participant/cancel")
	public ResponseEntity<String> cancelInvite(int inv_no, int participant_no) {
		ResponseEntity<String> entity = null;

		try {
			is.cancelInvite(inv_no, participant_no);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@PatchMapping("invitation")
	public ResponseEntity<String> modifyInvitation(InvitationVO vo) {
		ResponseEntity<String> entity = null;

		try {
			is.update(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@DeleteMapping("participant/{no}")
	public ResponseEntity<String> delete(@PathVariable("no") int no) {
		try {
			is.deleteParticipant(no);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
	}

	@DeleteMapping("invitation/{no}")
	public ResponseEntity<String> deleteInvatation(@PathVariable("no") int no) {
		try {
			is.delete(no);
			return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("FAILED", HttpStatus.BAD_REQUEST);
		}
	}

}
