<?php
/*---------------------------------------------------------------------------
* @Module Name: Forum
* @Description: Forum for LiveStreet
* @Version: 1.0
* @Author: Chiffa
* @LiveStreet Version: 1.0
* @File Name: Text.class.php
* @License: CC BY-NC, http://creativecommons.org/licenses/by-nc/3.0/
*----------------------------------------------------------------------------
*/

class PluginForum_ModuleText extends PluginForum_Inherit_ModuleText {
	/**
	 * Обработка тега spoiler в тексте
	 *
	 * @param string $sTag	Тег на ктором сработал колбэк
	 * @param array $aParams Список параметров тега
	 * @return string
	 */
	public function CallbackTagSpoiler($sTag,$aParams,$sContent) {
		$sSpoilerName=isset($aParams['name']) ? $aParams['name'] : '';
		return "<div class='spoiler-wrap'><div class='spoiler-body' data-name='{$sSpoilerName}'>{$sContent}</div></div>";
	}
	/**
	 * Обработка тега bloquote в тексте
	 * <pre>
	 * <bloquote reply="112"> text </bloquote>
	 * </pre>
	 *
	 * @param string $sTag	Тег на ктором сработал колбэк
	 * @param array $aParams Список параметров тега
	 * @return string
	 */
	public function CallbackTagQuote($sTag,$aParams,$sContent) {
		$sText='';
		if (isset($aParams['reply'])) {
			if ($oPost=$this->PluginForum_Forum_GetPostById($aParams['reply'])) {
				$sUserLogin=$oPost->getUser() ? "<a href=\"{$oPost->getUser()->getUserWebPath()}\" class=\"ls-user\">{$oPost->getUser()->getLogin()}</a>" : $this->Lang_Get('plugin.forum.guest_prefix').$oPost->getGuestName();
				$sHeadQuote="<div class='quote-head'><a class='icon-share-alt' href='{$oPost->getUrlFull()}' title='{$this->Lang_Get('plugin.forum.post_view')}'></a> {$sUserLogin} ({$oPost->getDateAdd()}):</div>";
				$sTextQuote="<div class='quote-text'>{$sContent}</div>";
				$sFullQuote="<blockquote>{$sHeadQuote}{$sTextQuote}</blockquote> ";
				$sText.=$sFullQuote;
			}
		} else {
			$sText="<blockquote>{$sContent}</blockquote>";
		}
		return $sText;
	}
}
?>