import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Sets up the appearance and movement behaviors of projectiles
 * 
 * Garrett Grey
 */
public class Projectile extends Mover
{
    private final GreenfootImage plazer = new GreenfootImage("player-lazer.png"); //sets up the image that represents the lazer from the player
    private final GreenfootImage elazer = new GreenfootImage("enemy-lazer.png"); //sets up the image that represents the lazer from an enemy (not used)
    public boolean projInWorld; //determines whether or not the projectile is in the world
    private boolean projType; //shows what type of projectile it is, true is from player, false is from enemy
    /**
     * Projectile contructor
     */
    public Projectile(int projtype){
        this.speed = 14;
        if (projtype == 1){
            setImage(plazer);
            projType = true;
        }
        if (projtype == 2){
            setImage(elazer);
            projType = false;
        }
    }
    
    /**
     * Determines the behavior of projectiles
     */
    public void act() 
    {
       if (projType == true){ 
           moveUp();
       }else{
           moveDown();
       }    
       if (getY() <= 5){
            getWorld().removeObject(this);
            this.projInWorld = false;
       }else if(getY() >= 745){
            getWorld().removeObject(this);
            this.projInWorld = false;
       }else if(getOneObjectAtOffset(0, 2, Enemies.class) != null){
            Space S = (Space)getWorld();
            Counter scoreCounter = S.getScoreCounter();
            scoreCounter.add(100);
            getWorld().removeObject(getOneObjectAtOffset(0, 8, Enemies.class));
            getWorld().addObject(new DeadActor(), getX(), getY());
            getWorld().removeObject(this);
            this.projInWorld = false;
       }else if(getOneObjectAtOffset(0, 2, Player.class) != null && !projType){
           Player.isDead = true;
           getWorld().removeObject(this);
           this.projInWorld = false;
       }    
    }    
}

