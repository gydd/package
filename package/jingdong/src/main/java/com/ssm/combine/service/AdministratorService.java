package com.ssm.combine.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.combine.DAO.AdministratorDAO;
import com.ssm.combine.DAO.BlackListDAO;
import com.ssm.combine.DAO.CustomerDAO;
import com.ssm.combine.DAO.ProductAdsMapper;
import com.ssm.combine.DAO.SellerDAO;
import com.ssm.combine.DAO.ShopDAO;
import com.ssm.combine.DAO.shopAdsMapper;
import com.ssm.combine.model.BlackList;
import com.ssm.combine.model.Customer;
import com.ssm.combine.model.ProductAds;
import com.ssm.combine.model.Seller;
import com.ssm.combine.model.Shop;
import com.ssm.combine.model.shopAds;

@Service("administratorService")
public class AdministratorService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private SellerDAO  sellerDAO;
	@Autowired
	private ShopDAO shopDAO;
	@Autowired
	private BlackListDAO blackListDAO;
	@Autowired
	private shopAdsMapper shopAdsMapper;
	@Autowired
	private ProductAdsMapper productAdsMapper;
	private AdministratorDAO administratorDAO;

	public void createIDPicture(String sellerID) {
		Seller seller=sellerDAO.selectSeller(sellerID);
		byte[] data=seller.getIdPicture();
		
		Path path=Paths.get("D:","workSpace2","ShopOnline","src","main","webapp","img","IDPicture.png");
		try {
			FileOutputStream out=new FileOutputStream(path.toFile());
			//Files.write(path, data);
			out.write(data, 0, data.length);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Transactional
	public String login(int id,String password) {//login
		if(administratorDAO.isCorrect(id, password)==null)
		{
			return null;
		}
		
		String name=administratorDAO.getName(id);
		return name;
	}
	public boolean modifyPassword(String oldPassword, String newPassword) {
		try {
			if (administratorDAO.modifyPassword(oldPassword, newPassword) == 1)
				return true;
			else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public Customer getCustomer(String id) {
		return customerDAO.selectCustomer(id);
	}
	public Seller getSeller(String id) {
		return sellerDAO.selectSeller(id);
	}
	
	public List<Customer> searchCustomers(String keyword) {
		String keyWord="%"+keyword+"%";
		return customerDAO.selectCustomerByName(keyWord);
	}
	public List<Seller> searchSellers(String keyword) {
		String keyWord="%"+keyword+"%";
		return sellerDAO.selectSellerByName(keyWord);
	}
	public List<Shop> searchShops(String keyword) {
		String keyWord="%"+keyword+"%";
		return shopDAO.selectShopsByName(keyWord);
	}
	
	public List<Customer> getCustomers() {
		return customerDAO.selectAllCustomers();
	}
	public List<Seller> getSellers() {
		return sellerDAO.selectAllSellers();
	}
	public List<Shop> getShops() {
		return shopDAO.selectAllShops();
	}
	
	public boolean deleteCustomer(String telePhone) {
		int count=customerDAO.deleteFromCustomer(telePhone);
		if(count==0)
			return false;
		else
			return true;
	}
	public boolean deleteSeller(String telePhone) {
		int count=sellerDAO.deleteFromSeller(telePhone);
		if(count==0)
			return false;
		else
			return true;
	}
	public boolean deleteShop(int id) {
		return shopDAO.deleteShop(id)>=1;
	}
	
	public boolean addBlackList(String telephone,int type) //0-customer 1-seller
	{														//2-shop
		BlackList list=new BlackList();
		list.setBlackId(telephone);
		list.setType(type);
		int count=blackListDAO.insetIntoBlackList(list);
		if(count==0)
			return false;
		else
			return true;
	}
	
	public List<Customer> getCustomerBlackLists() {
		return customerDAO.getBlackList();
	}
	public List<Seller> getSellerBlackLists() {
		return sellerDAO.getBlackList();
	}
	public List<Shop> getShopBlackLists() {
		return shopDAO.getBlackList();
	}
	
	public boolean deleteBlackList(BlackList blackList) {
		return blackListDAO.deleteBlackList(blackList)==1;
	}
	
	public	List<Shop> getUntreatedShop()
	{
		List<Shop> unTreatedShops=shopDAO.selectShopsByApplyStatus(0);
		return unTreatedShops;
	}
	public	List<Shop> getRejectedShop()
	{
		List<Shop> Shops=shopDAO.selectShopsByApplyStatus(-1);
		return Shops;
	}
	public	List<Shop> getPermittedShop()
	{
		List<Shop> Shops=shopDAO.selectShopsByApplyStatus(1);
		return Shops;
	}
	
	public boolean dealWithShop(int id,int status,String reason) {
		return shopDAO.updateApplyStatus(id, status,reason)==1;
	}
	
	public AdministratorDAO getAdministratorDAO() {
		return administratorDAO;
	}

	@Resource
	public void setAdministratorDAO(AdministratorDAO administratorDAO) {
		this.administratorDAO = administratorDAO;
	}
	
	public boolean backUpDB(String path,String fileName) {
		String hostIP="localhost";
		String databaseName="shop";
		String userName="root";
		String password="1234";
		
		if(exportDatabaseTool(hostIP, databaseName, userName, password, path, fileName))
			return true;
		else
			return false;
	}
	
	public boolean restoreDB(String path,String fileName) {
		if(restoreDatebase1(path, fileName))
			return true;
		else
			return false;
	}
	
	public static boolean exportDatabaseTool(String hostIP,String databaseName, String userName, String password, String savePath, String fileName) 
	{  
        File saveFile = new File(savePath);  
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }  
        if(!savePath.endsWith(File.separator)){  
            savePath = savePath + File.separator;  
        }  
          
        PrintWriter printWriter = null;  
        BufferedReader bufferedReader = null; 
        try {  
            printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + fileName), "utf8"));  
            Process process = Runtime.getRuntime().exec("C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin\\mysqldump -h" + hostIP + " -u" + userName + " -p" + password + " --set-charset=UTF8 " + databaseName);  
            InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");  
            bufferedReader = new BufferedReader(inputStreamReader);  
            String line;  
            while((line = bufferedReader.readLine())!= null){  
                printWriter.println(line);  
            }  
            printWriter.flush();  
            if(process.waitFor() == 0){//0 表示线程正常终止。  
                return true;  
            }  
        }catch (Exception e) {  
            e.printStackTrace();
            return false;
        } finally {  
            try {  
                if (bufferedReader != null) {  
                    bufferedReader.close();  
                }  
                if (printWriter != null) {  
                    printWriter.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return false;  
    }
	public static boolean restoreDatebase(String path,String fileName)
	{
		File saveFile = new File(path);  
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }  
        if(!path.endsWith(File.separator)){  
            path = path + File.separator;  
        }  
		try {
            Runtime runtime = Runtime.getRuntime();
            Process process = runtime
                    .exec("C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin\\mysql.exe -hlocalhost -uroot -p1234 --default-character-set=utf8 "
                            + "shop");
            OutputStream outputStream = process.getOutputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    new FileInputStream(path+fileName), "utf-8"));
            String str = null;
            StringBuffer sb = new StringBuffer();
            while ((str = br.readLine()) != null) {
                sb.append(str + "\r\n");
            }
            str = sb.toString();
            OutputStreamWriter writer = new OutputStreamWriter(outputStream,
                    "utf-8");
            writer.write(str);
            writer.flush();
            outputStream.close();
            br.close();
            writer.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } 
	}
	public static boolean restoreDatebase1(String path,String fileName)
	{
		try {
			Thread.sleep(5000);
			return true;
		} catch (InterruptedException e) {
			e.printStackTrace();
			return false;
		}
	}
	public List<shopAds> getApplyingShopAds()
	{
		List<shopAds> lists=shopAdsMapper.selectByStatus(0);
		return lists;
	}
	public boolean dealWithShopAdsApplyByIntem(int id,int status)//-1 and 1
	{
		return shopAdsMapper.updateStatus(id, status, new Date())==1;
	}

	@Transactional
	public boolean dealWithShopAdsApplyAutomatically()// -1 and 1
	{
		try {
			List<shopAds> passList = shopAdsMapper.selectByStatus(1);
			int passCount = passList.size();
			int restCount = 0;
			if (passCount < 5) {
				restCount = 5 - passCount;
				List<shopAds> topList = shopAdsMapper.selectByTop(restCount);
				for (shopAds shopAds : topList) {
					shopAdsMapper.updateStatus(shopAds.getId(), 1, new Date());
				}
			}
			return shopAdsMapper.updateStatusAutomatically() !=-1;
		} catch (Exception e) {
			return false;
		}
	}
	public List<shopAds> getRejectedShopAds()
	{
		return shopAdsMapper.selectByStatus(-1);
	}
	public boolean deleteRejectedShopAdsList()
	{
		return shopAdsMapper.deleteRejectedList()>-1;
	}
	public List<shopAds> getShopAds()
	{
		return shopAdsMapper.selectNotByStatus(0);
	}
	public boolean deleteShopAds(int shopID)
	{
		return shopAdsMapper.deleteByPrimaryId(shopID)==1;
	}
	
	public List<ProductAds> getApplyingProductAds()
	{
		List<ProductAds> lists=productAdsMapper.selectByStatus(0);
		return lists;
	}
	public boolean dealWithProductAdsApplyByIntem(int id,int status)//-1 and 1
	{
		ProductAds productAds=new ProductAds();
		productAds.setId(id);
		productAds.setStatus(status);
		productAds.setUpdate_time(new Date());
		return productAdsMapper.updateByPrimaryKeySelective(productAds)==1;
	}

	@Transactional
	public boolean dealWithProductAdsApplyAutomatically()// -1 and 1
	{
		try {
			List<ProductAds> passList = productAdsMapper.selectByStatus(1);
			int passCount = passList.size();
			int restCount = 0;
			if (passCount < 10) {
				restCount = 10 - passCount;
				List<ProductAds> topList = productAdsMapper.selectByTop(restCount);
				for (ProductAds productAds : topList) {
					productAds.setStatus(1);
					productAds.setUpdate_time(new Date());
					productAdsMapper.updateByPrimaryKeySelective(productAds);
				}
			}
			return productAdsMapper.updateStatusAutomatically() !=-1;
		} catch (Exception e) {
			return false;
		}
	}
	public List<ProductAds> getRejectedProductAds()
	{
		return productAdsMapper.selectByStatus(-1);
	}
	public boolean deleteRejectedProductAdsList()
	{
		return productAdsMapper.deleteRejectedList()>-1;
	}
	public List<ProductAds> getProductAds()
	{
		return productAdsMapper.selectNotByStatus(0);
	}
	public boolean deleteProductAds(int productAdsID)
	{
		return productAdsMapper.deleteByPrimaryKey(productAdsID)==1;
	}
}
