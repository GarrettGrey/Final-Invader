import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.Random; // Provides funcionality for random integers, taken from StackOverflow (http://stackoverflow.com/questions/5887709/getting-random-numbers-in-java).

/**
 * Makes the illusion of flying through space
 * 
 * Garrett Grey
 */
public class BgItem extends Mover
{
    private final GreenfootImage star = new GreenfootImage("star.png"); //sets up the image that represents a star
    public boolean starInWorld; //determines if there is a star in the world
    Random rand = new Random(); //sets up functionality for random numbers
    
    /**
     * Background Item constructor
     */
    public BgItem(int bgtype){
        this.speed = 14;
        if (bgtype == 1){
            setImage(star);
        }
    }
    
    /**
     * Determines the behavior of the stars in the background
     */
    public void act() 
    {
        if(starInWorld != true){
            getWorld().addObject(new BgItem(1), rand.nextInt(500),0);
            starInWorld = true;
        }
        if(starInWorld == true){
            moveDown();
            if(getY() >= 749){
                getWorld().removeObject(this);
                starInWorld = false;
            } 
        } 
    }    
}
