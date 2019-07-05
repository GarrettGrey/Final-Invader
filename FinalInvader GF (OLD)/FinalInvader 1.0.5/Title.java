import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Sets up the Title text's appearance
 * 
 * Garrett Grey
 */
public class Title extends Mover
{
    private final GreenfootImage title = new GreenfootImage("title.png");
    Space S = (Space)getWorld();
    /**
     * Act - do whatever the Title wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */

    public void act() 
    {
        title.scale(500, 252);
        setImage(title);
    }  
}
