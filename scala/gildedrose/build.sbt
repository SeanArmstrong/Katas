name := "KataBase"

version := "0.1"

scalaVersion := "2.12.8"

lazy val kataBase = (project in file("."))
  .settings(
    name := "KataBase",
    libraryDependencies += "org.scalatest" %% "scalatest" % "3.0.5" % Test,
    libraryDependencies += "org.scalactic" %% "scalactic" % "3.0.5"
  )