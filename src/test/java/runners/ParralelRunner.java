package runners;
        import io.qameta.allure.Allure;
        import com.intuit.karate.Results;
        import com.intuit.karate.Runner;
        import static org.junit.jupiter.api.Assertions.*;
        import org.apache.commons.io.FileUtils;
        import org.junit.jupiter.api.Test;
        import java.io.File;


class ParralelRunner {
    @Test
    void testFeaturesInParallel() throws Exception{
        Results results = Runner.path("./src/test/java/test/features")
                .parallel(3);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        File file = new File("./target/src/test/java/test/features/resources/playedcount.txt");
        String content = FileUtils.readFileToString(file, "UTF-8");
        System.out.print(content);
        File marketNo = new File("./target/src/test/java/test/features/resources/marketno.txt");
        String marketNos = FileUtils.readFileToString(marketNo, "UTF-8");
        Allure.addAttachment("PlayedCount", content);
        Allure.addAttachment("MarketNo", marketNos);
    }

}
