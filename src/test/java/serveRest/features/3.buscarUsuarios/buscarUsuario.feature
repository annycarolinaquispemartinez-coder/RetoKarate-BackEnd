@Regresion
@buscarUsuario
Feature: Buscar Usuario

  Background:
    Given url baseurl


  Scenario: CP-008 - Validar la busqueda de  usuario por ID
    Given path '/usuarios' + '/0uxuPY0cbmQhpEz1'
    When method get
    Then status 200
    * def usuarioSchema = read('classpath:serveRest/schema/schemaListarUsuarios.json')
    And match response == usuarioSchema


  Scenario: CP-009 -Buscar usuario por ID inexistente
    Given path '/usuarios' + '/0uxuPY0cbmQhp555'
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'