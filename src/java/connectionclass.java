import java.sql.*;

public class connectionclass {
    String connectionUrl = "jdbc:derby://localhost:1527/";
    String dbName = "covid19";
    String userId = "bacel";
    String password = "bacel123";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
}
