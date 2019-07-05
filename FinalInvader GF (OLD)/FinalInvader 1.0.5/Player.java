import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.Random; // Provides funcionality for random integers, taken from StackOverflow (http://stackoverflow.com/questions/5887709/getting-random-numbers-in-java).


/**
 * Sets up the Player, Enemies, and powerup behaviors
 * 
 * Garrett Grey 
 */
public class Player extends Mover
{
    private final GreenfootImage psprite = new GreenfootImage("player.png"); //sets up the image that represents the player
    private final GreenfootImage invis = new GreenfootImage("tansparent.png");
    private final GreenfootImage gameover = new GreenfootImage("gameover.png");
    public static boolean isDead; //determines whether or not the pleyer is dead
    Projectile p1; //refrence for a projectile from the player
    Projectile p2; //refrence for a projectile from the player
    Projectile p3; //refrence for a projectile from the player
    Powerup powup; //reference to a powerup
    Random rand = new Random(); //sets up functionality for random numbers
    private int powupCounter; //a counter for when a powerup appears
    public boolean powupInWorld; //determines whether a powerup is in the world
    public boolean hasDoubleLazer; //determines whether the player has the double lazer powerup
    public boolean hasTripleLazer; //determines whether the player has the triple lazer powerup
    private int powupType; //the type of powerup that is spawned
    public int enemyCounter; //a counter for whem an enemy appears
    Enemies e1; //one of four enemies that can be onscreen at a time
    Enemies e2; //one of four enemies that can be onscreen at a time
    Enemies e3; //one of four enemies that can be onscreen at a time
    Enemies e4; //one of four enemies that can be onscreen at a time
    public boolean e1InWorld; //determines whether e1 is in the world
    public boolean e2InWorld; //determines whether e2 is in the world
    public boolean e3InWorld; //determines whether e3 is in the world
    public boolean e4InWorld; //determines whether e4 is in the world
    private int powupEffCounter; //a counter for when the effect of a powerup will dissapear
    private int deathCounter; //a counter for when the player will respawn after dying
    private boolean deadActorSpawned; //determines whether or not DeadActor was spawned after the player dies so that multiple DeadActors don't spawn.
    public boolean shouldActorsSpawn; //determines whether or not enemies and powerups should spawn.
    
    /**
     * Sets up the player and projectiles
     */
    public Player(){
        this.speed = 7;
        setImage(psprite);
        psprite.scale(100,75); 
        p1 = new Projectile(1);
        p2 = new Projectile(1);
        p3 = new Projectile(1);
        powup = new Powerup(powupType);
    } 
    
    /**
     * Sets up the player's ability to move and shoot, the behavior of powerups when they're in the world and their effects on the player, and when enemies will spawn.
     */
    public void act() 
    {
        if (shouldActorsSpawn == true){
            powupCounter++;
            enemyCounter++;
            if (isDead != true){
                checkKeys();
            }else{
                die();
            }
            if(enemyCounter >= 150){
                if (e1InWorld != true){
                    e1 = new Enemies(rand.nextInt(4));
                    getWorld().addObject(e1, rand.nextInt(500), -50);
                    enemyCounter = 0;
                }else if (e2InWorld != true){
                    e2 = new Enemies(rand.nextInt(4));
                    getWorld().addObject(e2, rand.nextInt(500), -50);
                    enemyCounter = 0;
                }else if (e3InWorld != true){
                    e3 = new Enemies(rand.nextInt(4));
                    getWorld().addObject(e3, rand.nextInt(500), -50);
                    enemyCounter = 0;
                }else if (e4InWorld != true){
                    e4 = new Enemies(rand.nextInt(4));
                    getWorld().addObject(e4, rand.nextInt(500), -50);
                    enemyCounter = 0;
                }
            }
            if(powupCounter >= 1000 && powupInWorld != true){
                powupType = rand.nextInt(3);
                powupCounter = 0;
                getWorld().addObject(powup, rand.nextInt(500),0);
                powupInWorld = true;
            }
            if(powupInWorld){
                powup.moveDown();
                if(powup.getY() >= 749){
                    powupInWorld = false;
                    getWorld().removeObject(powup);
                }else if((powup.getX() <= getX() + 38 && powup.getX() >= getX() - 38) && powup.getY() == 700){
                    if(powupType == 0 && isDead == false){
                        Space S = (Space)getWorld();
                        Counter lifeCounter = S.getLifeCounter();
                        lifeCounter.add(1);
                    }
                    if(powupType == 1){
                        if (hasTripleLazer){
                            hasTripleLazer = false;
                        }
                        hasDoubleLazer = true;   
                    }
                    if(powupType == 2){
                        if (hasDoubleLazer){
                            hasDoubleLazer = false;
                        }
                        hasTripleLazer = true;
                    }
                    powupInWorld = false;
                    getWorld().removeObject(powup);
                }
            }
            if (hasDoubleLazer || hasTripleLazer){
                powupEffCounter++;
                if (powupEffCounter >= 3000){
                    hasDoubleLazer = false;
                    hasTripleLazer = false;
                    powupEffCounter = 0;
                }    
            }
        }
    } 
    
    /**
     * has the player move and shoot when the coresponding keys are pressed
     */
    private void checkKeys(){
         isKeyPressed = false;
         if (Greenfoot.isKeyDown("right")){
             moveRight();
             isKeyPressed = true;
         }else if (Greenfoot.isKeyDown("left")){
             moveLeft();
             isKeyPressed = true;
         }
         if (Greenfoot.isKeyDown("space")){
             isKeyPressed = true;
             if (hasTripleLazer == true){
                 getWorld().addObject(p1, getX() + 25, getY());
                 getWorld().addObject(p2, getX() - 25, getY());
                 getWorld().addObject(p3, getX(), getY());
                 if (p1.projInWorld == false || p2.projInWorld == false || p3.projInWorld == false){
                     Greenfoot.playSound("ppew.wav");
                    }
                 p1.projInWorld = true;
                 p2.projInWorld = true;
                 p3.projInWorld = true;
             }else if (hasDoubleLazer == true){
                 getWorld().addObject(p1, getX() + 25, getY());
                 getWorld().addObject(p2, getX() - 25, getY());
                 if (p1.projInWorld == false || p2.projInWorld == false){
                     Greenfoot.playSound("ppew.wav");
                    }
                 p1.projInWorld = true;
                 p2.projInWorld = true;
             }else{    
                 getWorld().addObject(p1, getX(), getY());
                 if (p1.projInWorld == false){
                     Greenfoot.playSound("ppew.wav");
                    }
                 p1.projInWorld = true;
             }   
         }
    }
    
    /**
     * What happens when a player dies.
     */
    public void die(){
         Space S = (Space)getWorld();
         Counter lifeCounter = S.getLifeCounter();
         int lives = lifeCounter.getValue();
         deathCounter++;
         if (deadActorSpawned != true){
             lifeCounter.subtract(1);
             getWorld().addObject(new DeadActor(), getX(), getY());
             deadActorSpawned = true;
         } 
         setImage(invis);
         setLocation(250, 700);   
         if (deathCounter >= 100){
             if (lives != 0){
                 setImage(psprite);
                 isDead = false;
                 deadActorSpawned = false;
                 deathCounter = 0;
             }else{
                 shouldActorsSpawn = false;
                 setLocation(250, 350);
                 setImage(gameover);
                 gameover.scale(500,250);
             }    
         }   
    }    
}
