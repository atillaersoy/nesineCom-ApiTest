package runners;
import io.qameta.allure.Epic;
import io.qameta.allure.Story;
import com.intuit.karate.junit5.Karate;

@Epic("Nesine Case")
@Story("Login And Get Public Feeds")
class loginGetPublicFeeds {
    @Karate.Test
    Karate loginGetPublicFeeds() {
        return Karate.run("./src/test/java/test/features/loginGetPublicFeeds.feature");
    }
}
