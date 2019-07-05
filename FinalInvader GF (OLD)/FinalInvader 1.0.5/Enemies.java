import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Sets up Enemy behaviors
 * 
 * Garrett Grey
 */
public class Enemies extends Mover
{
    private final GreenfootImage enemy1 = new GreenfootImage("enemy-1.png");// sets up the image that represents enemy type 1
    private final GreenfootImage enemy2 = new GreenfootImage("enemy-2.png");// sets up the image that represents enemy type 2
    private final GreenfootImage enemy3 = new GreenfootImage("enemy-3.png");// sets up the image that represents enemy type 3
    private final GreenfootImage enemy4 = new GreenfootImage("enemy-4.png");// sets up the image that represents enemy type 4
    private int enemyType; //helps the program easily determine what the enemy type is
    private boolean hitLeft; //helps determine what enemy type 2 should do if it hits the borders of the world
    private boolean isInWorld; //determines whether or not the enemy is in the world
    private int moveCounter; //counter for moving
    private int shootCounter; //counter for shooting
    Projectile p; //refrence for a projectile from the enemy
    
    /**
     * Enemy constructor
     */
    public Enemies(int selection){
        enemyType = selection;
        isInWorld = true;
        if (selection == 0){
            this.speed = 7;
            setImage(enemy1);
            enemy1.scale(39, 114);
        }
        if (selection == 1){
            this.speed = 3;
            setImage(enemy2);
            enemy2.scale(39, 114);
        }
        if (selection == 2){
            this.speed = 14;
            setImage(enemy3);
            enemy3.scale(39, 114);
        }
        if (selection == 3){
            this.speed = 7;
            setImage(enemy4);
            enemy4.scale(39, 114);
            p = new Projectile(2);
        }
    }
    
    /**
     * Determines the behavior of enemies
     */
    public void act() 
    {
        if (enemyType == 0 || enemyType == 2){
            moveDown();
        }
        if (enemyType == 1){
            moveDown();
            if (hitLeft != true){
                moveLeft();
                if (getX() == 0){
                    hitLeft = true;
                }    
            }
            if (hitLeft == true){
                moveRight();
                if (getX() == 499){
                    hitLeft = false;
                }    
            }
        }
        if (enemyType == 3){
            moveCounter++;
            if(moveCounter <= 500){
                shootCounter++;
                if(shootCounter >= 100){
                    getWorld().addObject(p, getX(), getY() + 50);
                    Greenfoot.playSound("epew.wav");
                    shootCounter = 0;
                }    
                if (hitLeft != true){
                    moveLeft();
                    if (getX() == 0){
                        hitLeft = true;
                    }    
                }
                if (hitLeft == true){
                    moveRight();
                    if (getX() == 499){
                        hitLeft = false;
                    }    
                }
            }else{
                moveDown();
            }
        }    
        if (getY() >= 745){
            moveCounter = 0;
            getWorld().removeObject(this);
            isInWorld = false;
        }
        if (isInWorld == true){
            collisionDetection();
        }
    }
    
    /**
     * Checks if the enemy hit the player. If it did, the player dies.
     */
    private void collisionDetection(){
        Space S = (Space)getWorld();
        Counter scoreCounter = S.getScoreCounter();
        if(Player.isDead == false){
            if(getOneObjectAtOffset(-21,29, Player.class) != null || getOneObjectAtOffset(21,29, Player.class)
            != null){
                moveCounter = 0;
                shootCounter = 0;
                Player.isDead = true;
                getWorld().addObject(new DeadActor(), getX(), getY());
                getWorld().removeObject(this);
            } 
        }    
    }
}
