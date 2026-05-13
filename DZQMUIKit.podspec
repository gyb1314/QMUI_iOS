Pod::Spec.new do |s|
  s.name             = "DZQMUIKit"
  s.version          = "4.9.0"
  s.summary          = "致力于提高项目 UI 开发效率的解决方案"
  s.description      = <<-DESC
                       QMUI iOS 是一个致力于提高项目 UI 开发效率的解决方案，其设计目的是用于辅助快速搭建一个具备基本设计还原效果的 iOS 项目，同时利用自身提供的丰富控件及兼容处理， 让开发者能专注于业务需求而无需耗费精力在基础代码的设计上。不管是新项目的创建，或是已有项目的维护，均可使开发效率和项目质量得到大幅度提升。
                       DESC
  s.homepage         = "https://github.com/gyb1314/QMUI_iOS"
  s.license          = 'MIT'
  s.author           = {"gyb1314" => "gyb1314@example.com"}
  s.source           = {:git => "https://github.com/gyb1314/QMUI_iOS.git", :tag => s.version.to_s}
  #s.source           = {:git => "https://github.com/gyb1314/QMUI_iOS.git", :branch => 'master'}
  s.social_media_url = 'https://github.com/gyb1314/QMUI_iOS'
  s.requires_arc     = true
  s.documentation_url = 'https://github.com/gyb1314/QMUI_iOS'
  s.screenshot       = 'https://cloud.githubusercontent.com/assets/1190261/26751376/63f96538-486a-11e7-81cf-5bc83a945207.png'

  s.platform         = :ios, '13.0'
  s.frameworks       = 'Foundation', 'UIKit', 'CoreGraphics'
  s.preserve_paths   = 'QMUIConfigurationTemplate/*'
  s.source_files     = 'QMUIKit/QMUIKit.h'
  s.resource_bundles = {'QMUIKit' => ['QMUIKit/PrivacyInfo.xcprivacy']}

  s.subspec 'QMUICore' do |ss|
    ss.source_files = 'QMUIKit/QMUIKit.h', 'QMUIKit/QMUICore', 'QMUIKit/UIKitExtensions', 'QMUIKit/UIKitExtensions/QMUIBarProtocol'
    ss.frameworks = 'CoreImage', 'ImageIO'
    ss.dependency 'DZQMUIKit/QMUIWeakObjectContainer'
    ss.dependency 'DZQMUIKit/QMUILog'
  end

  s.subspec 'QMUIMainFrame' do |ss|
    ss.source_files = 'QMUIKit/QMUIMainFrame'
    ss.dependency 'DZQMUIKit/QMUICore'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUINavigationTitleView'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUITableView'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewHeaderFooterView'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUIKeyboardManager'
    ss.dependency 'DZQMUIKit/QMUILog'
    ss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
  end

  s.subspec 'QMUIResources' do |ss|
    ss.resource_bundles = {'QMUIResources' => ['QMUIKit/QMUIResources/*.*']}
    ss.pod_target_xcconfig = {
      'EXPANDED_CODE_SIGN_IDENTITY' => '',
      'CODE_SIGNING_REQUIRED' => 'NO',
      'CODE_SIGNING_ALLOWED' => 'NO',
    }
  end

  s.subspec 'QMUIWeakObjectContainer' do |ss|
    ss.source_files = 'QMUIKit/QMUIComponents/QMUIWeakObjectContainer.{h,m}'
  end

  s.subspec 'QMUILog' do |ss|
    ss.source_files = 'QMUIKit/QMUIComponents/QMUILog/*.{h,m}'
  end

  s.subspec 'QMUIComponents' do |ss|

    ss.dependency 'DZQMUIKit/QMUICore'

    ss.subspec 'QMUICAAnimationExtension' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/CAAnimation+QMUI.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUICALayerExtension' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/CALayer+QMUIViewAnimation.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUIAnimation' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIAnimation'
    end

    ss.subspec 'QMUINavigationTitleView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUINavigationTitleView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUIButton' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIButton/QMUIButton.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILayouter'
    end

    ss.subspec 'QMUINavigationButton' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIButton/QMUINavigationButton.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
    end

    ss.subspec 'QMUIToolbarButton' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIButton/QMUIToolbarButton.{h,m}'
    end

    ss.subspec 'QMUITableView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITableView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewProtocols'
    end

    ss.subspec 'QMUITableViewProtocols' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITableViewProtocols.{h,m}'
    end

    ss.subspec 'QMUIEmptyView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIEmptyView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUILabel' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUILabel.{h,m}'
    end

    ss.subspec 'QMUILayouter' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUILayouter/*.{h,m}'
    end
    
    ss.subspec 'QMUISheetPresentation' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUISheetPresentation/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUINavigationButton'
    end

    ss.subspec 'QMUIKeyboardManager' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIKeyboardManager.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    # 从这里开始就是非必须的组件
    
    ss.subspec 'QMUIMultipleDelegates' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIMultipleDelegates/*.{h,m}'
    end
    
    ss.subspec 'QMUIAlertController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIAlertController.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIModalPresentationViewController'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextField'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIKeyboardManager'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
    end

    ss.subspec 'QMUIAppearance' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIAppearance.{h,m}'
    end

    ss.subspec 'QMUICellHeightCache' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUICellHeightCache.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewProtocols'
    end

    ss.subspec 'QMUICellHeightKeyCache' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUICellHeightKeyCache/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewProtocols'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUICellSizeKeyCache' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUICellSizeKeyCache/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUIConsole' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIConsole/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIResources'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextField'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewCell'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUICellHeightKeyCache'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPopupMenuView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUICAAnimationExtension'
    end

    ss.subspec 'QMUICollectionViewPagingLayout' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUICollectionViewPagingLayout.{h,m}'
    end

    ss.subspec 'QMUIDialogViewController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIDialogViewController.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIModalPresentationViewController'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextField'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewCell'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUINavigationTitleView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUIEmotionView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIEmotionView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIResources'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
    end

    ss.subspec 'QMUIFloatLayoutView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIFloatLayoutView.{h,m}'
    end

    ss.subspec 'QMUIGridView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIGridView.{h,m}'
    end

    ss.subspec 'QMUIImagePreviewView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIImagePreviewView/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIZoomImageView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUICollectionViewPagingLayout'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPieProgressView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
    end

    ss.subspec 'QMUIMarqueeLabel' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIMarqueeLabel.{h,m}'
    end

    ss.subspec 'QMUIModalPresentationViewController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIModalPresentationViewController.{h,m}'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIKeyboardManager'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUIMoreOperationController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIMoreOperationController.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIModalPresentationViewController'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUIOrderedDictionary' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIOrderedDictionary.{h,m}'
    end

    ss.subspec 'QMUIPieProgressView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIPieProgressView.{h,m}'
    end

    ss.subspec 'QMUIPopupContainerView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIPopupContainerView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end

    ss.subspec 'QMUIPopupMenuView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIPopupMenuView/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILayouter'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPopupContainerView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUICheckbox'
    end
    
    ss.subspec 'QMUIScrollAnimator' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIScrollAnimator/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUIEmotionInputManager' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIEmotionInputManager.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmotionView'
    end

    ss.subspec 'QMUISearchBar' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUISearchBar.{h,m}'
    end

    ss.subspec 'QMUISearchController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUISearchController.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUISearchBar'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
    end

    ss.subspec 'QMUISegmentedControl' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUISegmentedControl.{h,m}'
    end

    ss.subspec 'QMUITableViewCell' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITableViewCell.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
    end

    ss.subspec 'QMUITableViewHeaderFooterView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITableViewHeaderFooterView.{h,m}'
    end

    ss.subspec 'QMUITestView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITestView.{h,m}'
    end

    ss.subspec 'QMUITextField' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITextField.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUITextView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITextView.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUITheme' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITheme/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIImagePickerLibrary'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAlertController'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIConsole'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmotionView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIGridView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIImagePreviewView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPopupContainerView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPopupMenuView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextField'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITextView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIToastView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIModalPresentationViewController'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIBadge'
    end

    ss.subspec 'QMUITips' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUITips.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIResources'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIToastView'
    end
    
    ss.subspec 'QMUIWindowSizeMonitor' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIWindowSizeMonitor.{h,m}'
    end

    ss.subspec 'QMUIZoomImageView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIZoomImageView.{h,m}'
      sss.frameworks = 'PhotosUI', 'CoreMedia', 'AVFoundation', 'QuartzCore'
      sss.dependency 'DZQMUIKit/QMUIResources'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
			sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPieProgressView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAssetLibrary'
    end

    ss.subspec 'QMUIAssetLibrary' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/AssetLibrary/*.{h,m}'
      sss.frameworks = 'Photos', 'CoreServices'
    end

    ss.subspec 'QMUIImagePickerLibrary' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/ImagePickerLibrary/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIResources'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIImagePreviewView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewCell'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUINavigationButton'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAssetLibrary'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIZoomImageView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAlertController'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIEmptyView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIAppearance'
    end


    ss.subspec 'QMUILogManagerViewController' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUILogManagerViewController.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIStaticTableView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIPopupMenuView'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUISearchController'
    end

    ss.subspec 'QMUILogWithConfigurationSupported' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUILogger+QMUIConfigurationTemplate.{h,m}'
    end

    ss.subspec 'NavigationBarTransition' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/NavigationBarTransition/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIMainFrame'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUINavigationTitleView'
    end

    ss.subspec 'QMUIBadge' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUIBadge/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUILabel'
    end

    ss.subspec 'QMUIToastView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/ToastView/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIKeyboardManager'
    end

    ss.subspec 'QMUIStaticTableView' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/StaticTableView/*.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUITableViewCell'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIMultipleDelegates'
    end

    ss.subspec 'QMUICheckbox' do |sss|
      sss.source_files = 'QMUIKit/QMUIComponents/QMUICheckbox.{h,m}'
      sss.dependency 'DZQMUIKit/QMUIComponents/QMUIButton'
      sss.dependency 'DZQMUIKit/QMUIResources'
    end

  end

end
