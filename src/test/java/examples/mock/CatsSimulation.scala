package mock

import io.gatling.core.Predef._
import com.intuit.karate.gatling.PreDef._
import scala.concurrent.duration._

class CatsSimulation extends Simulation {
  val protocol = karateProtocol(
    "/cats/{id}" -> Nil,
    "/cats" -> pauseFor("get" ->15,"post" ->25
    )
  )

  protocol.nameResolver = (req,rtc) => req.getHeader("karate-name")

  val create = scenario("create").exec(karateFeature("classpath:booking/auth.feature"))
  setUp(
    create.inject(rampUsers(10) during(5 seconds)).protocols(protocol)
  )
}