{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce Sp. z o.o
********************************************************************************/
-->*}
{strip}
	<div class="d-flex flex-wrap flex-md-nowrap px-3 w-100">
		<input type="hidden" id="conversion_available_status"
			   value="{if !empty($CONVERSION_AVAILABLE_STATUS)}{\App\Purifier::encodeHtml($CONVERSION_AVAILABLE_STATUS)}{/if}"/>
		<div class="u-min-w-md-70 w-100">
			<div class="moduleIcon">
				<span class="o-detail__icon js-detail__icon userIcon-{$MODULE}"></span>
			</div>
			<div class="pl-1">
				<div class="d-flex flex-nowrap align-items-center js-popover-tooltip" data-ellipsis="true" data-content="{$RECORD->getName()}" data-toggle="popover" data-js="tooltip">
					<h4 class="recordLabel h6 mb-0 js-popover-text" data-js="clone">
						<span class="modCT_{$MODULE_NAME}">{$RECORD->getName()}</span>
					</h4>
					<span class="fas fa-info-circle fa-sm js-popover-icon d-none" data-js="class: d-none"></span>
					{assign var=RECORD_STATE value=\App\Record::getState($RECORD->getId())}
					{if $RECORD_STATE !== 'Active'}
						{assign var=COLOR value=AppConfig::search('LIST_ENTITY_STATE_COLOR')}
						<div class="badge badge-secondary ml-1" {if $COLOR[$RECORD_STATE]}style="background-color: {$COLOR[$RECORD_STATE]};"{/if}>
							{if \App\Record::getState($RECORD->getId()) === 'Trash'}
								{\App\Language::translate('LBL_ENTITY_STATE_TRASH')}
							{else}
								{\App\Language::translate('LBL_ENTITY_STATE_ARCHIVED')}
							{/if}
						</div>
					{/if}
				</div>
				<div class="js-popover-tooltip d-flex flex-nowrap align-items-center" data-ellipsis="true" data-content="{$RECORD->getDisplayValue('company')}" data-toggle="popover" data-js="tooltip">
					<span class="designation_label text-muted u-white-space-nowrap">{$RECORD->getDisplayValue('designation')}</span>
					{if $RECORD->getDisplayValue('designation') && $RECORD->getDisplayValue('company')}
						&nbsp;{\App\Language::translate('LBL_AT')}&nbsp;
					{/if}
					<span class="js-popover-text" data-js="clone">
						<span class="company_label">{$RECORD->getDisplayValue('company')}</span>
					</span>
					<span class="fas fa-info-circle fa-sm js-popover-icon d-none" data-js="class: d-none"></span>

				</div>
				<div class="js-popover-tooltip d-flex flex-nowrap align-items-center" data-ellipsis="true" data-content="{$RECORD->getDisplayValue('assigned_user_id')}" data-toggle="popover" data-js="tooltip">
					<span class="mr-1 text-muted u-white-space-nowrap">
						{\App\Language::translate('Assigned To',$MODULE_NAME)}:
					</span>
					<span class="js-popover-text" data-js="clone">{$RECORD->getDisplayValue('assigned_user_id')}</span>
					<span class="fas fa-info-circle fa-sm js-popover-icon d-none" data-js="class: d-none"></span>
				</div>
				{assign var=SHOWNERS value=$RECORD->getDisplayValue('shownerid')}
				{if $SHOWNERS != ''}
					<div class="js-popover-tooltip d-flex flex-nowrap align-items-center" data-ellipsis="true" data-content='{$SHOWNERS}' data-toggle="popover" data-js="tooltip">
						<span class="mr-1 text-muted u-white-space-nowrap">
							{\App\Language::translate('Share with users',$MODULE_NAME)}:
						</span>
						<span class="js-popover-text" data-js="clone">{$SHOWNERS}</span>
						<span class="fas fa-info-circle fa-sm js-popover-icon d-none" data-js="class: d-none"></span>
					</div>
				{/if}
			</div>
		</div>
		{include file=\App\Layout::getTemplatePath('Detail/HeaderFields.tpl', $MODULE_NAME) HEADER_TYPE=value}
	</div>
	{include file=\App\Layout::getTemplatePath('Detail/HeaderFields.tpl', $MODULE_NAME) HEADER_TYPE=process}
{/strip}
