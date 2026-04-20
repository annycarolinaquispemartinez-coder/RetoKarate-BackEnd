@Regresion
@eliminarUsuario
Feature: Eliminar usuario

  Background:
    Given url baseurl


  Scenario: CP-011 - Validar Eliminar usuario
    * def resultadoRegistro = call read('classpath:serveRest/features/2.crearUsuarios/crearUsuario.feature@registroExitoso')
    * def idAEliminar = resultadoRegistro.userId
    Given path '/usuarios/' + idAEliminar
    When method delete
    Then status 200
    And match response.message contains 'Registro excluído com sucesso'


  Scenario: CP-012 - Validar Eliminar usuario ya excluido

    Given path '/usuarios/' + 'BGxIaa3HR9bYCEkn'
    When method delete
    Then status 200
    And match response.message contains 'Nenhum registro excluído'