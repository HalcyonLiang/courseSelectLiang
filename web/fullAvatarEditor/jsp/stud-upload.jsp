<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.util.*"%>
<%@ page import="com.alibaba.fastjson.*"%>
<%@ page import="edu.findvideo.factory.DaoFactory" %>
<%@ page import="edu.findvideo.bean.Student" %>
<%
String contentType = request.getContentType();
String virtualPath="";

if ( contentType.indexOf("multipart/form-data") >= 0 )
{
	Result result = new Result();
	result.avatarUrls = new ArrayList();
	result.success = false;
	result.msg = "Failure!";

	String userid;
	String username;

	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	FileItemIterator fileItems = upload.getItemIterator(request);
	//����һ���������Դ��浱ǰͷ������
	int avatarNumber = 1;
	//ȡ������ʱ��+8λ�������Ϊ�����ļ���ȷ���ļ������ظ���
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssS"); 
	String fileName = simpleDateFormat.format(new Date());
	Random random = new Random();
	String randomCode = "";
	for ( int i = 0; i < 8; i++ )
	{
		randomCode += Integer.toString(random.nextInt(36), 36);
	}
	fileName = fileName + randomCode;
	//����ԭͼ�ĳ�ʼ������
	String initParams = "";
	BufferedInputStream	inputStream;
	BufferedOutputStream outputStream;
	//����?��
	while( fileItems.hasNext() )
	{
		FileItemStream fileItem = fileItems.next();
		String fieldName = fileItem.getFieldName();
		//�Ƿ���ԭʼͼƬ file �����ƣ�Ĭ�ϵ� file ��������__source�����ڲ�����ò������Զ��塣������src_field_name��
		Boolean isSourcePic = fieldName.equals("__source");
		//��ǰͷ�����ԭͼ�ĳ�ʼ������ֻ���ϴ�ԭͼʱ�Żᷢ�͸���ݣ��ҷ��͵ķ�ʽΪPOST���������޸�ͷ��ʱ��֤�������ͼ���ͷ��ʱһ�£������û�����ȡ�
		//�޸�ͷ��ʱ����Ĭ�ϼ��ص�ԭͼurlΪ��ǰԭͼurl+�ò���ɣ���ֱ�Ӹ��ӵ�ԭͼurl�д��棬��Ӱ��ͼƬ���֡�
		if ( fieldName.equals("__initParams") )
		{
			inputStream = new BufferedInputStream(fileItem.openStream());
			byte[] bytes = new byte [inputStream.available()];
			inputStream.read(bytes); 
			initParams = new String(bytes, "UTF-8");
			inputStream.close();
		}
		//�����ԭʼͼƬ file �����ƻ�����Ĭ�ϵ�ͷ������ƵĲ��֡�__avatar����ͷ(Ĭ�ϵ�ͷ������ƣ�__avatar1,2,3...�����ڲ�����ò������Զ��壬������avatar_field_names)
		else if ( isSourcePic || fieldName.startsWith("__avatar") )
		{
			virtualPath = "/img/jtpo/user/stud/jsp_avatar" + avatarNumber + "_" + fileName + ".jpg";
			//ԭʼͼƬ��Ĭ�ϵ� file ��������__source�����ڲ�����ò������Զ��塣������src_field_name����
			if( isSourcePic )
			{
				//�ļ�������Ǳ��ػ�����ͼƬΪԭʼ�ļ������������ͷ������Ϊ *FromWebcam.jpg
				String sourceFileName = fileItem.getName();	
				//ԭʼ�ļ�����չ��(����.��)
				String sourceExtendName = sourceFileName.substring(sourceFileName.lastIndexOf('.') + 1);
				result.sourceUrl = virtualPath = String.format("/img/jtpo/user/stud/jsp_source_%s.%s", fileName, sourceExtendName);
			}
			//ͷ��ͼƬ��Ĭ�ϵ� file �����ƣ�__avatar1,2,3...�����ڲ�����ò������Զ��壬������avatar_field_names����
			else
			{
				result.avatarUrls.add(virtualPath);
				avatarNumber++;
			}
			inputStream = new BufferedInputStream(fileItem.openStream());
			outputStream = new BufferedOutputStream(new FileOutputStream(application.getRealPath("/") + virtualPath.replace("/", "\\")));
			Streams.copy(inputStream, outputStream, true);
//            int s=(Integer)request.getSession().getAttribute("username");
//            DaoFactory.getInstance().getStudentServer().updateStudent(s,"headimg",virtualPath);
//            request.getSession(true).setAttribute("userInfo",DaoFactory.getInstance().getStudentServer().getStudentById(s));
			inputStream.close();
            outputStream.flush();
            outputStream.close();
		}
		else
		{
			//ע�͢� upload_url�д��ݵĲ�ѯ����������methodΪpost��ʹ������Ĵ��룬������ɾ���ע������Ĵ���鲢ʹ��ע�͢ڵĴ���
			inputStream = new BufferedInputStream(fileItem.openStream());
			byte[] bytes = new byte [inputStream.available()];
			inputStream.read(bytes); 
			inputStream.close();
			if (fieldName.equals("userid"))
			{
				result.userid = new String(bytes, "UTF-8");
			}
			else if (fieldName.equals("username"))
			{
				result.username = new String(bytes, "UTF-8");
			}
		}
	}

    virtualPath = "/img/jtpo/user/stud/jsp_avatar1"  + "_" + fileName + ".jpg";
    int s=(Integer)request.getSession().getAttribute("username");
    DaoFactory.getInstance().getStudentServer().updateStudent(s,"headimg",virtualPath);
    request.getSession(true).setAttribute("userInfo",DaoFactory.getInstance().getStudentServer().getStudentById(s));
	//ע�͢� upload_url�д��ݵĲ�ѯ����������methodΪget��ʹ������ע�͵Ĵ���
	/*
	result.userid = request.getParameter("userid");
	result.username = request.getParameter("username");
	*/

	if ( result.sourceUrl != null )
	{
		result.sourceUrl += initParams;
	}
	result.success = true;
	result.msg = "Success!";
	/*
		To Do...���ڴ˴����?������
	*/
	//����ͼƬ�ı�����������Ϊjson�ַ������й��죬�ô�ʹ��fastjson���죩
	out.println(JSON.toJSONString(result));
}
%>
<%!
/**
* ��ʾ�ϴ��Ľ��
*/
private class Result
{
	/**
	* ��ʾͼƬ�Ƿ����ϴ��ɹ���
	*/
	public Boolean success;
	public String userid;
	public String username;
	/**
	* �Զ���ĸ�����Ϣ��
	*/
	public String msg;
	/**
	* ��ʾԭʼͼƬ�ı����ַ��
	*/
	public String sourceUrl;
	/**
	* ��ʾ����ͷ��ͼƬ�ı����ַ���ñ���Ϊһ�����顣
	*/
	public ArrayList avatarUrls;
}
%>