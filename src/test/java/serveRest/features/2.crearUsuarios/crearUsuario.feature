@Regresion
@crearUsuario
Feature: Crear usuario

  Background:
    Given url baseurl
@registroExitoso
  Scenario: CP-005 - Validar Registro usuario exitoso
    Given path '/usuarios'
    * def randomEmail = 'user' + Math.floor(Math.random() * 100000) + '@mail.com'
    * def bodyCrearUsuario = read('classpath:serveRest/request/crearUsuario/bodyCrearUsuario.json')
    * set bodyCrearUsuario.email = randomEmail
    And request bodyCrearUsuario
    When method post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And def userId = response._id


  Scenario Outline: CP-006 - Validar que no se pueda crear usuario con datos en vacio
    Given path '/usuarios'
    And def bodyCrearUsuario = read('classpath:serveRest/request/crearUsuario/bodyCrearUsuario.json')
    * set bodyCrearUsuario.nome = '<name>'
    * set bodyCrearUsuario.email = '<email>'
    * set bodyCrearUsuario.password = '<password>'
    And request bodyCrearUsuario
    When method post
    Then status 400
    And match response.<campo> == '<mensaje>'

    Examples:
      | Caso         | name | email            | password | campo    | mensaje                           |
      | Sin nombre   |      | prueba@email.com | 12345    | nome     | nome não pode ficar em branco     |
      | Sin email    | Anny |                  | 12345    | email    | email não pode ficar em branco    |
      | Sin paswword | Anny | prueba@email.com |          | password | password não pode ficar em branco |

