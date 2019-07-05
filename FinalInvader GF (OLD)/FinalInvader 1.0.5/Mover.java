import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Helps subcalsses move.
 * 
 * Garrett Grey
 */
public class Mover extends Actor
{
    public int speed;
    public boolean isKeyPressed;
    protected int addObject;
    /**
     * Move an object to the right, taken from 2D Platformer
     */
    public void moveRight(){
        setLocation(getX() + speed, getY());
    }

    /**
     * Move an object to the left, taken from 2D Platformer
     */
    public void moveLeft(){
        setLocation(getX() - speed, getY());
    }
    
    /**
     * Move an object upwards, taken from 2D Platformer
     */
    protected void moveUp(){
        setLocation(getX(), getY() - speed);
    }
    
    /**
     * Move an object downwards, taken from 2D Platformer
     */
    protected void moveDown(){
        setLocation(getX(), getY() + speed);
    } 
}
