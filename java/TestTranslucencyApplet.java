import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
/* TestTranslucencyApplet.java */
import java.security.NoSuchAlgorithmException;



public class TestTranslucencyApplet 
{
    public static void main(String[] args)
    {
        String pass = args[0];
        byte[] hash = new byte[0];
        try
        {
            hash = hashMD5(pass);
        }
        catch (UnsupportedEncodingException | NoSuchAlgorithmException ex)
        {
            System.out.println("Encoding method not supported.");
        }
        System.out.println(hash);
    }
    
    //hash string input using MD5
    public static byte[] hashMD5(String inputString) throws UnsupportedEncodingException, NoSuchAlgorithmException
    {
        byte[] messageBytes = inputString.getBytes("UTF-8");
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(messageBytes);
        return digest;    
    }
    
    //convert byte array to hex-string
    public static String toHexString(byte[] input)
    {
        String result = "";
        
        return result;
    }
}