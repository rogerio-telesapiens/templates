<main class="bg_gray">
  <div class="container margin_30">
    <div class="row">
      <div class="card">
        <div class="col-lg-6 col-md-6 mt-4">
          
            <h3>Pedido lojaaaaaaaaaaaaaaaaa 46 #{$DADOS_PEDIDO.PEDIDO_LOJA} - {$DADOS_PEDIDO.DATA}</h3>
          
        </div>

        <div class="card-body">
          <form class="form theme-form" method="post" action="{$GET_SITE_HOME}loja/pedido/atualizar-cobranca">
            <input type="hidden" name="TOKEN" value="{$TOKEN_TELA}">
            <input type="hidden" name="ID" value="{$TOKEN_ID}">
            <div class="row">


              <span><strong>Meio de Pagamento :</strong> {$DADOS_PEDIDO.MEIOPAGAMENTO}</span><br>
              <span><strong>Status:</strong> {$DADOS_PEDIDO.STATUS}</span>
              <div>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                  {if $DADOS_PEDIDO.POSSUI_DOCUMENTOS eq '1'}
                    <a href="{$GET_SITE_HOME}loja/documento/anexar/{$TOKEN_ID}" class="btn_1"
                      role="button">Documentos para Matrícula </a>
                    </span>
                  {/if}
                  {if $DADOS_PEDIDO.TERMO_USO neq '0'}
                    <a href="{$GET_SITE_HOME}externo/pdf_termo_uso.php?pedido={$TOKEN_ID}" class="btn_1 mt-2" target="_blank"
                      role="button">Download Contrato</a>
                  {/if}
                </div>
              </div>
            </div>
            <div class="row">
          
              <div class="table table-striped cart-list mt-5" style="text-align: center">
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
              <table class="table table-striped cart-list" style="text-align: center">
                  <thead>
                    <tr>
                      <th>
                        {if $DADOS_PEDIDO.PODE_AGRUPAR eq 'true'}
                          <input name="det_chkTodasParcelas" id="det_chkTodasParcelas"
                            onchange="SelecionarTodas(this.checked);" type="checkbox">
                        {/if}
                      </th>
                      <th>Parcela</th>
                      <th>Fatura</th>
                      <th>Valor</th>
                      <th>Vencimento</th>
                      <th>Pagamento</th>
                      <th>Status</th>
                      <th>NFS-e</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$LISTA_PARCELAS item=$LIS}
                      {if $LIS.AGRUPADA eq '0'}
                        <tr>
                          <td>
                            {if $LIS.PODE_AGRUPAR eq 'true'}
                              <input value="{$LIS.VALOR_TOTAL}" class="parcela" name="det_chkParcela_{$LIS.TOKEN}"
                                type="checkbox" onchange="SelecionarParcela(this.checked,{$LIS.VALOR_TOTAL});">
                            {/if}
                          </td>
                          <td>{$LIS.PARCELA}</td>
                          <td>{$LIS.FATURA_NUMERO}</td>
                          <td>R$ {$LIS.VALOR}</td>
                          <td>{$LIS.VENCIMENTO}</td>
                          <td>
                            {if $LIS.AGRUPADA eq '0'}
                              {$LIS.PAGAMENTO}
                            {/if}
                          </td>
                          <td style="max-width: 30%; word-break: normal;">
                            {if $LIS.AGRUPADA eq '1'}
                              Parcela Agrupada
                            {else}
                              {$LIS.STATUS}
                            {/if}
                          </td>
                          <td>
                            {if $LIS.AGRUPADA eq '0'}
                              {if $LIS.LINK_NF eq ''}
                                Indisponível
                              {else}
                                <a class="btn_1" href="{$LIS.LINK_NF}">Download</a>
                              {/if}
                            {/if}
                          </td>
                        </tr>
                      {/if}
                    {/foreach}
                  </tbody>
                </table>
              </div>
            </div>
            <div>
              <div id="det_divTotalSelecionado"></div>
            </div>
          </form>

          <div class="card-footer text-end" id="divGravar">
            <a class="btn_1 mt-2" href="{$GET_SITE_HOME}loja/pedido/listar">Ir para Meus Pedidos</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

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
          '<br>Valor Total: ' + $TotalSelecionado +
          '<br><button class="btn_1" type="submit" >Gerar Cobrança</button>';
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