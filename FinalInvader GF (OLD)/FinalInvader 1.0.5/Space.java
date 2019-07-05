import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.awt.Color; // Provides funcionality for setting the background color, taken from 2D Platformer.
import java.util.Random; // Provides funcionality for random integers, taken from StackOverflow (http://stackoverflow.com/questions/5887709/getting-random-numbers-in-java).

/**
 * The world
 * 
 * Garrett Grey
 */
public class Space extends World
{
    private Counter scoreCounter; // A counter for the score
    private Counter lifeCounter; // A counter for the lives the player has
    GreenfootImage background = getBackground(); //Sets up the background
    Random rand = new Random(); //sets up functionality for random numbers
    Title T = new Title();
    public boolean playerInWorld;
    /**
     * Sets up the world
     */
    public Space(){    
        super(500, 750, 1); 
        Greenfoot.setSpeed(50);
        Greenfoot.start();
        scoreCounter = new Counter ("Score:");
        lifeCounter = new Counter ("Lives:");
        lifeCounter.setValue(3);
        setPaintOrder(Counter.class, Title.class, DeadActor.class, Player.class, Projectile.class, Powerup.class, Enemies.class, BgItem.class);
        background.setColor(new Color(0, 0, 0));
        background.fill();
        addObject(T, 250, 350);
        addObject(new BgItem(1), rand.nextInt(500),5);
        HUD();   
        playerInWorld = false;
    }  

    public void act(){
        if (playerInWorld == false && Greenfoot.isKeyDown("space")){
            Player P = new Player();
            removeObject(T);
            addObject(P, 250, 700);
            playerInWorld = true;
            P.shouldActorsSpawn = true;
        } 
    }    

    /**
     * Sets up the lives and score counters
     */
    public void HUD(){
        addObject(scoreCounter, 67, 51);
        addObject(lifeCounter, 67, 21);
    }

    /**
     * Returns the value of the life counter whenever called
     */
    public Counter getLifeCounter(){
        return lifeCounter;
    }

    /**
     * Returns the value of the score counter whenever called
     */
    public Counter getScoreCounter(){
        return scoreCounter;
    }
}