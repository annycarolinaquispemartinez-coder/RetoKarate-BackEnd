@Regresion
@actualizarUsuario
Feature: Actualizar usuario

  Background:
    Given url baseurl


  Scenario: CP-010 - Validar la actualización de usuario existente con datos válidos

    Given path '/usuarios' + '/0uxuPY0cbmQhpEz1'
    And def bodyActualizarUsuario = read('classpath:serveRest/request/actualizarUsuario/bodyActualizarUsuario.json')
    * set bodyActualizarUsuario.email = 'beltrano@1qa.com.br'
    And request bodyActualizarUsuario
    When method put
    Then status 200
    And match response.message == 'Registro alterado com sucesso'


  Scenario: CP-011 - Validar la actualización de  usuario con email ya registrado

    Given path '/usuarios' + '/0uxuPY0cbmQhpEz1'
    And request read('classpath:serveRest/request/actualizarUsuario/bodyActualizarUsuario.json')
    When method put
    Then status 400
    And match response.message == 'Este email já está sendo usado'

