<div class="container-fluid">
  <div class="row">
    <form class="form theme-form" method="post" action="{$GET_SITE_HOME}loja/pedido/atualizar-cobranca">
      <div class="card">
        <div class="card-header">
          <div class="d-flex justify-content-between align-items-center mb-20">
            <h5 class="card-title mb-0">Pedido #{$DADOS_PEDIDO.PEDIDO_LOJA} - Atualização de Cobrança</h5>
          </div>
        </div>

        <div class="card-body">
          
            <input type="hidden" name="TOKEN" value="{$TOKEN_TELA}">
            <input type="hidden" name="ID" value="{$TOKEN_ID}">
            <div class="row">
              <span><strong>Status:</strong> {$DADOS_PEDIDO.STATUS}</span>
            </div>
            <div class="row">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Curso</th>
                      <th>Quantidade</th>
                      <th>Valor</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$LISTA_CURSOS item=$LIS}
                      <tr>
                        <td>{$LIS.CURSO}</td>
                        <td>{$LIS.QUANTIDADE}</td>
                        <td>{$LIS.VALOR}</td>
                      </tr>
                    {/foreach}
                  </tbody>
                </table>
              </div>
            </div>
            <div class="row">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Parcela</th>
                      <th>Valor</th>
                      <th>Vencimento Original</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$LISTA_PARCELAS item=$LIS}
                      <tr>
                        <td>{$LIS.PARCELA}</td>
                        <td>R$ {$LIS.VALOR}</td>
                        <td>{$LIS.VENCIMENTO}</td>
                      </tr>
                    {/foreach}
                  </tbody>
                </table>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-3">
                <div class="mb-3">
                  <label class="form-label">Valor Total</label>
                    <input readonly value="{$DADOS_PEDIDO.VALOR_TOTAL}" class="form-control" type="text">
                </div>
              </div>
              <div class="col-3">
                <div class="mb-3">
                  <label class="form-label">Vencimento</label>
                    <input readonly value="{$DADOS_PEDIDO.VENCIMENTO}" class="form-control" type="text">
                </div>
              </div>
              <div class="col-3">
                <div class="mb-3">
                  <label class="form-label">Meio Pagamento</label>
                  <select name="cob_cboMeioPagamento" class="form-select">
                    <option value="1" selected>Boleto</option>
                    <option value="3">PIX</option>
                  </select>
                </div>
              </div>
            </div>

        </div>
        <div class="card-footer text-end" id="divGravar">
          <div class="checkbox">
            <input id="cob_chkConfirma" type="checkbox" onchange="ConfirmaCobranca(this.checked);">
            <label for="cob_chkConfirma">Confirmo a geração de uma nova cobrança para as parcelas acima.</label>
          </div>
          <button disabled="disabled" id="cob_cmdGerar" class="btn btn-primary" href="{$GET_SITE_HOME}loja/pedido/atualizar-cobranca" name="action" value="gerar">Gerar Cobrança</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
  {literal}
    var $TotalSelecionado = 0;
    var $NumParcelas = 0;
    
    //==========================================================================
    $(document).ready(function() {
      $('#basic-1').DataTable({
        "language": {
            "url": window.location.origin+"/view/template/assets/json/pt-br.json"
        }
      });
    });
    
    //==========================================================================
    function ConfirmaCobranca($VALOR){
      if ($VALOR == true){
        document.getElementById("cob_cmdGerar").disabled = false;
      }else{
        document.getElementById("cob_cmdGerar").disabled = true;
      }
    }
    
  {/literal}
</script>