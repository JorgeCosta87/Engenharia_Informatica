
import java.io.Serializable;




public class Time implements Serializable  {
    
    //to be compatible with the class sended
    static final long serialVersionUID = 1L;
    
    int hour;
    int minute;
    int second;
    
    public Time(int hour, int minute, int second)
    {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    @Override
    public String toString() {
        return "Time{" + "hour=" + hour + ", minute=" + minute + ", second=" + second + '}';
    }    
    
    public int getHour() {
        return hour;
    }

    public int getMinute() {
        return minute;
    }

    public int getSecond() {
        return second;
    }
    
    
    
}
