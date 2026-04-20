
@Regresion
@login
Feature: Login API

  Background:
    Given url baseurl
    * def headers_login = read('classpath:serveRest/headers/headersLogin.json')

  @loginExitoso
  Scenario: CP-001 - Validar inicio de sesión exitoso con credenciales válidas
    Given path '/login'
    And headers headers_login
    * def body_200 = read('classpath:serveRest/request/login/loginexitoso.json')
    And request body_200
    When method POST
    Then status 200
    * def accessToken = response.authorization

@loginFallido
  Scenario: CP-002 - Validar Inicio de sesión fallido con credenciales inválidas
    Given path '/login'
    And headers headers_login
    * def body_401 = read('classpath:serveRest/request/login/loginNoExitoso.json')
    And request body_401
    When method POST
    Then status 401
    And match response.message == 'Email e/ou senha inválidos'

@loginSinPassword
  Scenario: CP-003 - Validar Inicio de sesión fallido sin Password
    Given path '/login'
    And headers headers_login
    * def body_400 = read('classpath:serveRest/request/login/loginSinPassword.json')
    And request body_400
    When method POST
    Then status 400
    And match response.password == 'password não pode ficar em branco'

@loginSinEmailSinPassword
  Scenario: CP-004 - Validar Inicio de sesión fallido sin email y sin password
    Given path '/login'
    And headers headers_login
    * def body400_400 = read('classpath:serveRest/request/login/loginSinEmailSinPassword.json')
    And request body400_400
    When method POST
    Then status 400
    And match response.email == 'email não pode ficar em branco'
    And match response.password == 'password não pode ficar em branco'

