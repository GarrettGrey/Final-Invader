import greenfoot.*;
/**
 * Explosion animation for dead Players and Enemies
 * 
 * Garrett Grey
 */
public class DeadActor extends Mover
{
    private int animationCounter; //helps determine when the image should be changed
    private final GreenfootImage exp1 = new GreenfootImage("explosion-1.png"); //sets up the first image in the animation
    private final GreenfootImage exp2 = new GreenfootImage("explosion-2.png"); //sets up the second image in the animation
    private final GreenfootImage exp3 = new GreenfootImage("explosion-3.png"); //sets up the third image in the animation

    /**
     * Does a short animation before disapearing
     */
    public void act(){
        if(animationCounter == 0){
            setImage(exp1);
        }else if(animationCounter == 2){
            setImage(exp2);
        }else if(animationCounter == 4){
            setImage(exp3);
        }else if(animationCounter >= 6){
            animationCounter = 0;
            getWorld().removeObject(this);
        }
        animationCounter++;
    }    
}
