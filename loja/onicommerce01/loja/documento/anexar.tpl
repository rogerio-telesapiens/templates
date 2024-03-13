
<div class="container margin_30">
<div class="row">
      <div class="card">
        <div class="card-header">
          <div class="d-flex justify-content-between align-items-center mb-20">
            <h5 class="card-title mb-0">Pedido #{$DADOS_REGISTRO.PEDIDO_LOJA} - {$DADOS_REGISTRO.PEDIDO_DATA}</h5>
          </div>
        </div>

        <div class="card-body">

          <input type="hidden" name="TOKEN" value="{$TOKEN_TELA}">
          <input type="hidden" name="ID" value="{$TOKEN_ID}">
          <div class="row">
            <span><strong>Abaixo está a relação de documentos necessários para concluir a inscrição no(s) curso(s)
                listado(s):</strong> </span>

          </div>
          <hr>
          <div class="row">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Documento</th>
                    <th>Obrigatório</th>
                    <th>Observação</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  {foreach from=$DADOS_REGISTRO.DOCUMENTOS item=$LIS}
                    <tr>
                      <td>
                        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                          {if $LIS.ARQUIVO eq '0'}
                            <button class="btn_1" role="button" data-bs-toggle="modal"
                              data-bs-target=".modalAnexar_{$LIS.HASH}">Anexar Arquivo</button>
                          {else}
                            {if $LIS.STATUS_ID neq '4'}
                              <button class="btn_1 small" role="button" data-bs-toggle="modal"
                                data-bs-target=".modalAnexar_{$LIS.HASH}">Alterar Arquivo</button>
                            {/if}
                            
                          {/if}
                          <div class="modal fade bd-example-modal-lg modalAnexar_{$LIS.HASH}" tabindex="-11" role="dialog"
                            aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content">
                                <form class="form theme-form" enctype="multipart/form-data" method="post"
                                  action="{$GET_SITE_HOME}loja/documento/anexar/{$TOKEN_PEDIDO}">
                                  <input type="hidden" name="TOKEN_TELA" value="{$TOKEN_TELA}">
                                  <input type="hidden" name="TOKEN_ID" value="{$LIS.HASH}">
                                  <div class="modal-header">
                                    <h4 class="modal-title" id="myLargeModalLabel">Anexar Documento</h4>
                                    <button class="btn-close" type="button" data-bs-dismiss="modal"
                                      aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                    <div class="row">
                                      <div class="col-12">
                                        <div class="mb-3">
                                          <label class="form-label">Tipo de Documento</label>
                                          <input type="text" readonly class="form-control" value="{$LIS.DOCUMENTO}">
                                        </div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-12">
                                        <div class="mb-3">
                                          <label class="form-label">Instruções</label>
                                          <input type="text" readonly class="form-control" value="{$LIS.TIPO_OBS}">
                                        </div>
                                      </div>
                                    </div>
                                    <div class="row">
                                      <div class="col-12">
                                        <div class="mb-3">
                                          <label class="form-label">Anexo</label>
                                          <input name="doc_filAnexo" required class="form-control" type="file"
                                            accept=".png, .jpg, .jpeg, .pdf">
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="modal-footer">
                                    <button class="btn_1" type="submit">Anexar</button>
                                  </div>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td>{$LIS.DOCUMENTO}</td>
                      <td>{$LIS.OBRIGATORIO}</td>
                      <td>{$LIS.OBS}</td>
                      <td>{$LIS.STATUS_NOME}</td>
                    </tr>
                  {/foreach}
                </tbody>
              </table>
            </div>
          </div>

          <div class="card-footer text-end" id="divGravar">
            <a class="btn_1" href="{$GET_SITE_HOME}loja/pedido/detalhes/{$DADOS_REGISTRO.PEDIDO_HASH}">Enviar para
              análise</a>
            <a class="btn_1" href="{$GET_SITE_HOME}loja/pedido/detalhes/{$DADOS_REGISTRO.PEDIDO_HASH}">Voltar para
              detalhes do pedido</a>
          </div>
        </div>
      </div>
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
          "url": window.location.origin + "/view/template/assets/json/pt-br.json"
        }
      });

    });

    //==========================================================================
    function ExibirTotal() {
      if ($NumParcelas >= 1) {
        document.getElementById("det_divTotalSelecionado").innerHTML = 'Parcelas Selecionadas: ' + $NumParcelas +
          '<br>Valor Total: ' + $TotalSelecionado + '<br><button class="btn_1" type="submit" >Gerar Cobrança</button>';
      } else {
        document.getElementById("det_divTotalSelecionado").innerHTML = '';
      }
    }

    //==========================================================================
    function SelecionarTodas($SELECIONAR) {
      var $Parcelas = document.getElementsByClassName("parcela");
      $TotalSelecionado = 0;
      Array.from($Parcelas).forEach(($parcela) => {
        $parcela.checked = $SELECIONAR;
        if ($SELECIONAR == true) {
          $TotalSelecionado = $TotalSelecionado + ($parcela.value * 1.00);
          $NumParcelas = $NumParcelas + 1;
        } else {
          $TotalSelecionado = 0;
          $NumParcelas = 0;
        }
      });
      ExibirTotal();
    }

    //==========================================================================
    function SelecionarParcela($SELECIONADO, $VALOR) {
      if ($SELECIONADO == true) {
        $TotalSelecionado = $TotalSelecionado + $VALOR;
        $NumParcelas = $NumParcelas + 1;
      } else {
        document.getElementById('det_chkTodasParcelas').checked = false;
        $TotalSelecionado = $TotalSelecionado - $VALOR;
        $NumParcelas = $NumParcelas - 1;
      }
      ExibirTotal();
    }
  {/literal}
</script>