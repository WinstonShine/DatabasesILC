import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
/* TestTranslucencyApplet.java */
import java.security.NoSuchAlgorithmException;



public class TestTranslucencyApplet 
{
    public static void main(String[] args)
    {
        //cmd argument for Password to be hashed
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
        System.out.println(bytesToHex(hash));
    }
    
    //hash string input using MD5
    public static byte[] hashMD5(String inputString) throws UnsupportedEncodingException, NoSuchAlgorithmException
    {
        byte[] messageBytes = inputString.getBytes("UTF-8");
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(messageBytes);
        return digest;    
    }

    //https://stackoverflow.com/questions/9655181/how-to-convert-a-byte-array-to-a-hex-string-in-java
    //convert byte array to hex-string
    public static String bytesToHex(byte[] bytes)
    {
        final char[] HEX_ARRAY = "0123456789ABCDEF".toCharArray();
        char[] hexChars = new char[bytes.length * 2]; //why is string output 2 times the length of byte array input?
        for (int i = 0; i < bytes.length; i++) {
            int v = bytes[i] & 0xFF; //is & a bitwise operator and 0xFF a mask?
            hexChars[i * 2] = HEX_ARRAY[v >>> 4];
            hexChars[i * 2 + 1] = HEX_ARRAY[v & 0x0F];
        }
        return new String(hexChars);
    }
}