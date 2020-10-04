package com.project.car.services;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.project.car.dao.newsDAO;
import com.project.car.model.News;
import com.project.car.vo.NewsVO;

@Component
public class NewsServiceImpl implements NewsService{
	
	private static String clientID = "imJ805B2A2GZnNNlli75";
	private static String clientSecret = "c_DLlOUWLb";
	
	/*@Value("${path.upload}")
	private String path_upload;*/
	
	@Resource(name="path_upload")
	private String path_upload;

	@Autowired
	public newsDAO newsDAO;
	
	
	@Override
	public List<NewsVO> getnews (NewsVO news) {
		return newsDAO.getnews(news);
	}
	
	@Override
	public int newsCount(){
		return newsDAO.newsCount();
	}
	
	@Override
	public void delNews(int news_Id) {
		newsDAO.delNews(news_Id);
	}

	/*@Override
	public String saveUploadFile(MultipartFile news_Upload) {
		String upload = System.currentTimeMillis() + "_" + news_Upload.getOriginalFilename();
		
		try {
			news_Upload.transferTo(new File(path_upload + "/" + upload));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return upload;
	}*/

	@Override
	public void insNews(NewsVO newsvo) {
		
		/*MultipartFile news_Upload = newsvo.getNews_Upload();
		
		if(news_Upload.getSize() > 0) {
			String file_name = saveUploadFile(news_Upload);
			newsvo.setNews_file(file_name);
		}*/
		
		newsDAO.insNews(newsvo);
		
	}
	
	@Override
	public List<NewsVO> getOneNews(int news_Id) {
		return newsDAO.getOneNews(news_Id);
	}
	
	@Override
	public void updateNews(int news_Id) {
		
		newsDAO.updateNews(news_Id);
	}

	@Override
	public List<News> searchNews(String keyword, int display, int start) {
		List<News> list = null;
			try {
	            URL url;
	            url = new URL("https://openapi.naver.com/v1/search/"
	                    + "news.xml?query="
	                    + URLEncoder.encode(keyword, "UTF-8")
	                    + (display !=0 ? "&display=" +display :"")
	                    + (start !=0 ? "&start=" +start :""));
	 
	            URLConnection urlConn = url.openConnection();
	            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
	            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            
	            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	            XmlPullParser parser = factory.newPullParser();
	            parser.setInput(
	                    new InputStreamReader(urlConn.getInputStream()));
	           
	            int eventType = parser.getEventType();
	            News news = null;
	            while (eventType != XmlPullParser.END_DOCUMENT) {
	                switch (eventType) {
	                case XmlPullParser.END_DOCUMENT: // 문서의 끝
	                    break;
	                case XmlPullParser.START_DOCUMENT:
	                    list = new ArrayList<News>();
	                    break;
	                case XmlPullParser.END_TAG: {
	                    String tag = parser.getName();
	                    if(tag.equals("item"))
	                    {
	                        list.add(news);
	                        news = null;
	                    }
	                }
	                case XmlPullParser.START_TAG:{
	                    String tag = parser.getName();
	                    switch (tag) {
	                    case "item":
	                        news = new News();
	                        break;
	                    case "title":
	                        if(news != null)
	                            news.setTitle(parser.nextText());
	                        break;
	                    case "link":
	                        if(news != null)
	                        	news.setLink(parser.nextText());
	                        break;
	                    case "originallink":
	                        if(news != null)
	                        	news.setOriginallink(parser.nextText());
	                        break;
	                    case "description":
	                        if(news != null)
	                        	news.setDescription(parser.nextText());
	                        break;
	                    case "pubDate":
	                        if(news != null)
	                            news.setPubDate(parser.nextText());
	                        break;
	                    }
	                    
	                }
	                }
	                eventType = parser.next();
	            }
	            
	            for(News newsObject : list) {
	            	System.out.println(newsObject);
	            }
	            
	        } catch (MalformedURLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (XmlPullParserException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return list;
		}
	}

	
