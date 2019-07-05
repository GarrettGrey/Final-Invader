import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Sets up Powerup appearances which for some reason doesn't work. Eh, doesn't matter.
 * 
 * Garrett Grey
 */
public class Powerup extends Mover
{
    private final GreenfootImage lifesprite = new GreenfootImage("player.png"); //sets up the image that represents an extra life
    private final GreenfootImage dlazer = new GreenfootImage("dlazer.png"); //sets up the image that represents the double lazer
    private final GreenfootImage tlazer = new GreenfootImage("tlazer.png"); //sets up the image that represents the triple lazer
    
    /**
     * Sets up what the powerup will look like
     */
    public Powerup(int selection){
        this.speed = 7;
        if (selection == 0){
            setImage(lifesprite);
            lifesprite.scale(25,18);
        }
        if (selection == 1){
            setImage(dlazer);
            dlazer.scale(20,11);
        }
        if (selection == 2){
            setImage(tlazer);
            tlazer.scale(20,11);
        }
    }
}
