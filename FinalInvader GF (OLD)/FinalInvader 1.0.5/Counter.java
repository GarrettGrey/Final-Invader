import greenfoot.*; 
import java.awt.Color; 
import java.awt.Font;

   

/**
 * Generic counter class, it is used to count statistics such as remaining lives and amount of points.
 * @author
 * @version 1.1
 * THIS CALSS WAS COPIED FROM THE 2D PLATFORMER PROJECT
 */
public class Counter extends Actor  
{  
    private static final Color TRANSPARENT = new Color(0, 0, 0, 0);  
    public int value;  
    private Color textColor = Color.WHITE;  
    protected int target;
    private String prefix;

    public Counter()  
    {  
        value = 0;
        target = 0;
        this.prefix = prefix;
        updateImage();
        GreenfootImage image = getImage();
        Font font = image.getFont();
    }  

    public void act() 
    {
        if (value < target) {
            value++;
            updateImage();
        }
        else if (value > target) {
            value--;
            updateImage();
        }
    }

    private void updateImage()  
    {  
        int fontSize =24;
        setImage(new GreenfootImage(prefix+" "+value, fontSize, textColor, TRANSPARENT)); 
    }  

    public void setTextColor(Color color)  
    {  
        textColor = color;  
        updateImage();  
    }  

    public void setPrefix(String text)  
    {  
        prefix = text;  
        updateImage();  
    }  

    public Counter(String text)  
    {  
        prefix = text;  
        updateImage();  
    } 

    public void add(int score)  
    {  
        target += score;
        updateImage();  
    } 

    public void subtract(int score)  
    {  
        target -= score;
        updateImage();  
    } 

    public void setValue(int newValue)  
    {  
        target = newValue;
        value = newValue;
        updateImage();  
    }  

    public int getValue()  
    {  
        return target;  
    }  
} 