module BrNfe
	module Service
		module Prodeb
			module V2
				class RecepcaoLoteRps < BrNfe::Service::Prodeb::Base
					include BrNfe::Service::Concerns::Rules::RecepcaoLoteRps
					
					def certificado_obrigatorio?
						true
					end

					def wsdl
						"https://sefazweb.camacari.ba.gov.br/nfse/ws/recepcionarLoteRps?wsdl"
					end
					def method_wsdl
						:recepcionar_lote_rps
					end

					def id_attribute?
						true
					end

					def xml_builder
						render_xml 'servico_enviar_lote_rps_envio'
					end
				private
					def response_class
						BrNfe::Service::Response::RecepcaoLoteRps
					end

					def set_response
						@response = BrNfe::Service::Response::Build::RecepcaoLoteRps.new(
							savon_response: @original_response, # Rsposta da requisição SOAP
							keys_root_path: [:enviar_lote_rps_envio_response],
							body_xml_path:  nil,
							xml_encode:     response_encoding, # Codificação do xml de resposta
						).response
					end
				end
			end
		end
	end
end