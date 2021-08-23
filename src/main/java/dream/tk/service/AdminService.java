package dream.tk.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.api.SHA256;
import dream.tk.dao.AdminDAO;
import dream.tk.dao.BusinessMemberDAO;
import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.AdminDTO;
import dream.tk.dto.BusinessMemberDTO;
import dream.tk.dto.ClientMemberDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO daoA;

	@Autowired
	private ClientMemberDAO daoC;

	@Autowired
	private BusinessMemberDAO daoB;



	public List<Map<String,String>>getBlacklist(){
		return daoA.getBlackList();
	}

	public int businessOut(int seq){
		return daoA.businessOut(seq);
	}

	public int totalC() {
		return daoA.totalC();
	}
	public int totalB() {
		return daoA.totalB();
	}

	public List<String> totalPerMonthLabel(){
		List<String> totalPerMonthLabel = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			totalPerMonthLabel.add(daoA.clientPerMonth().get(i).getLabel());
		};
		return totalPerMonthLabel;
	}

	public List<Integer> totalPerMonthCounts(){
		List<Integer> totalPerMonthCounts = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			int client = daoA.clientPerMonth().get(i).getCounts();
			int business = daoA.businessPerMonth().get(i).getCounts();
			totalPerMonthCounts.add(client+business);
		};
		return totalPerMonthCounts;
	}

	public List<String> clietPerNationLabel(){
		List<String> clietPerNationLabel = new ArrayList<>();
		for(int i= 0;i<20;i++) {
			clietPerNationLabel.add(daoA.clietPerNation().get(i).getLabel());
		};
		return clietPerNationLabel;
	}

	public List<Integer> clietPerNationCounts(){
		List<Integer> clietPerNationCounts = new ArrayList<>();
		for(int i= 0;i<20;i++) {
			clietPerNationCounts.add(daoA.clietPerNation().get(i).getCounts());
		};
		return clietPerNationCounts;
	}

	public List<String> clientPerMonthLabel(){
		List<String> clientPerMonthLabel = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			clientPerMonthLabel.add(daoA.clientPerMonth().get(i).getLabel());
		};
		return clientPerMonthLabel;
	}
	public List<Integer> clientPerMonthCounts(){
		List<Integer> clientPerMonthCounts = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			clientPerMonthCounts.add(daoA.clientPerMonth().get(i).getCounts());
		};
		return clientPerMonthCounts;
	}

	public List<String> clientAgesLabel(){
		List<String> clientAgesLabel = new ArrayList<>();
		for(int i= 0;i<6;i++) {
			clientAgesLabel.add(daoA.clientAges().get(i).getLabel());
		};
		return clientAgesLabel;
	}
	public List<Integer> clientAgesCounts(){
		List<Integer> clientAgesCounts = new ArrayList<>();
		for(int i= 0;i<6;i++) {
			clientAgesCounts.add(daoA.clientAges().get(i).getCounts());
		};
		return clientAgesCounts;
	}	
	public List<String> businessPerMonthLabel(){
		List<String> businessPerMonthLabel = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			businessPerMonthLabel.add(daoA.businessPerMonth().get(i).getLabel());
		};
		return businessPerMonthLabel;
	}
	public List<Integer> businessPerMonthCounts(){
		List<Integer> businessPerMonthCounts = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			businessPerMonthCounts.add(daoA.businessPerMonth().get(i).getCounts());
		};
		return businessPerMonthCounts;
	}

	public List<String> reservationLabel(){
		List<String> reservationLabel = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			reservationLabel.add(daoA.reservation().get(i).getLabel());
		};
		return reservationLabel;
	}
	public List<Integer> reservationCounts(){
		List<Integer> reservationCounts = new ArrayList<>();
		for(int i= 0;i<12;i++) {
			reservationCounts.add(daoA.reservation().get(i).getCounts());
		};
		return reservationCounts;
	}

	public void insertC() {
		String[] nations = new String[]{"AR", "AU", "BR", "CA", "CN", "FR", "DE", "IN", "ID", "IT", "JP", "KR", "MX", "RU", "SA", "ZA", "TR", "GB", "US"};
		int indexN= 1;
		int indexD=1;
		Date[] dates = new Date[] { 
				java.sql.Date.valueOf("2020-09-18"), java.sql.Date.valueOf("2020-10-18"), 
				java.sql.Date.valueOf("2021-11-18"), java.sql.Date.valueOf("2021-12-18"), 
				java.sql.Date.valueOf("2021-01-18"), java.sql.Date.valueOf("2021-02-18"), 
				java.sql.Date.valueOf("2021-03-18"), java.sql.Date.valueOf("2021-04-18"),
				java.sql.Date.valueOf("2021-05-18"), java.sql.Date.valueOf("2021-06-18"),
				java.sql.Date.valueOf("2021-07-18"), java.sql.Date.valueOf("2021-08-18")};
		int yob=1;
		for(int i=300; i<400;i++) {
			indexN = (int)(Math.random()*19);
			indexD = (int)(Math.random()*12);
			String id = "test000"+String.valueOf(i);
			String pw = "test000"+String.valueOf(i)+"!!";
			String shaPW = SHA256.getSHA512(pw);
			String email = "test000"+String.valueOf(i)+"google.com";
			String name = "test000"+String.valueOf(i);
			yob =(int)(Math.random()*20)+1980;
			String nation = nations[indexN];
			String agree = "agree";
			Date reg_date = dates[indexD];
			daoC.insert(new ClientMemberDTO(0, id, shaPW, email, name, yob, nation, agree, reg_date));
		}
	}

	public void insertB() {
		int indexD=1;
		Date[] dates = new Date[] { 
				java.sql.Date.valueOf("2020-09-18"), java.sql.Date.valueOf("2020-10-18"), 
				java.sql.Date.valueOf("2021-11-18"), java.sql.Date.valueOf("2021-12-18"), 
				java.sql.Date.valueOf("2021-01-18"), java.sql.Date.valueOf("2021-02-18"), 
				java.sql.Date.valueOf("2021-03-18"), java.sql.Date.valueOf("2021-04-18"),
				java.sql.Date.valueOf("2021-05-18"), java.sql.Date.valueOf("2021-06-18"),
				java.sql.Date.valueOf("2021-07-18"), java.sql.Date.valueOf("2021-08-18")};

		for(int i=1; i<200;i++) {
			indexD = (int)(Math.random()*12);
			String id = "test000"+String.valueOf(i);
			String pw = "test000"+String.valueOf(i)+"!!";
			String shaPW = SHA256.getSHA512(pw);
			String name = "name000"+String.valueOf(i);
			String email = "test000"+String.valueOf(i)+"google.com";
			String phone = "01012341234";
			String premium = "N";
			Date reg_date = dates[indexD];
			daoB.insert(new BusinessMemberDTO(0, id, shaPW, name, email, phone, premium, reg_date, null, null));
		}
	}
	
	
	public int getSeq(int seq) {
		return daoA.getSeq(seq);
	}
	public int businessMemberOut(int businessMemberSeq){
		return daoA.businessOut(businessMemberSeq);
	}
	
}
