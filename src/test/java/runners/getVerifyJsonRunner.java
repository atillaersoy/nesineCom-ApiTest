package runners;
import io.qameta.allure.*;
import com.intuit.karate.junit5.Karate;

@Epic("Nesine Case")
@Story("get /Iddaa/PopularBetsModal and Verify JSON schema.")
class getVerifyJsonRunner {
    @Karate.Test
    Karate getVerifyJson() {
        return Karate.run("./src/test/java/test/features/getVerifyJson.feature");
    }

}
