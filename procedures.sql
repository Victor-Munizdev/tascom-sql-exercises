-- PROCEDURE para listar horários disponíveis de um médico em uma data informada - Parte 7
CREATE OR REPLACE PROCEDURE pr_horarios_disponiveis(
    p_cd_medico IN NUMBER,
    p_data IN DATE
) AS
BEGIN
    SELECT * FROM agenda
    WHERE cd_medico = p_cd_medico
    AND TRUNC(dt_agenda) = TRUNC(p_data);
END;
/
