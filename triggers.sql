-- Paciente precisa ter carteira (exceto particular) - Parte 4
CREATE OR REPLACE TRIGGER tg_paciente_carteira
BEFORE INSERT ON agenda
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    IF :NEW.tp_atendimento <> 'PARTICULAR' THEN
        SELECT COUNT(*) INTO v_count FROM carteira WHERE cd_paciente = :NEW.cd_paciente;
        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Paciente precisa ter carteira para este atendimento.');
        END IF;
    END IF;
END;
/

-- TRIGGER de log de alterações em agenda - Parte 7
CREATE OR REPLACE TRIGGER tg_log_agenda
AFTER INSERT OR UPDATE OR DELETE ON agenda
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO log_agenda (operacao, cd_agenda) VALUES ('INSERT', :NEW.cd_agenda);
    ELSIF UPDATING THEN
        INSERT INTO log_agenda (operacao, cd_agenda) VALUES ('UPDATE', :NEW.cd_agenda);
    ELSIF DELETING THEN
        INSERT INTO log_agenda (operacao, cd_agenda) VALUES ('DELETE', :OLD.cd_agenda);
    END IF;
END;
/
