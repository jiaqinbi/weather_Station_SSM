package cn.njut.domain;

/**
 * @author Bijiaqin
 * @date 2019/7/2 17:13
 */
public class Datal {
    private Integer id;
    private String username;
    private String temperature;
    private String humidity;
    private String air_pressure;
    private String wind_direction;
    private String wind_speed;

    @Override
    public String toString() {
        return "Datal{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", temperature='" + temperature + '\'' +
                ", humidity='" + humidity + '\'' +
                ", air_pressure='" + air_pressure + '\'' +
                ", wind_direction='" + wind_direction + '\'' +
                ", wind_speed='" + wind_speed + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }

    public String getAir_pressure() {
        return air_pressure;
    }

    public void setAir_pressure(String air_pressure) {
        this.air_pressure = air_pressure;
    }

    public String getWind_direction() {
        return wind_direction;
    }

    public void setWind_direction(String wind_direction) {
        this.wind_direction = wind_direction;
    }

    public String getWind_speed() {
        return wind_speed;
    }

    public void setWind_speed(String wind_speed) {
        this.wind_speed = wind_speed;
    }
}
