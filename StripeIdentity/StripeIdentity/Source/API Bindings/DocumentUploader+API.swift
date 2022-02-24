//
//  DocumentUploader+API.swift
//  StripeIdentity
//
//  Created by Mel Ludowise on 1/6/22.
//

import Foundation
import UIKit

extension DocumentUploader.Configuration {
    init(from capturePageConfig: VerificationPageStaticContentDocumentCapturePage) {
        self.init(
            filePurpose: capturePageConfig.filePurpose,
            highResImageCompressionQuality: capturePageConfig.highResImageCompressionQuality,
            highResImageCropPadding: capturePageConfig.highResImageCropPadding,
            highResImageMaxDimension: capturePageConfig.highResImageMaxDimension,
            lowResImageCompressionQuality: capturePageConfig.lowResImageCompressionQuality,
            lowResImageMaxDimension: capturePageConfig.lowResImageMaxDimension
        )
    }
}

extension VerificationPageDataDocumentFileData {
    init(
        scores: [IDDetectorOutput.Classification: Float]?,
        highResImage: String,
        lowResImage: String?,
        uploadMethod: FileUploadMethod
    ) {
        self.init(
            backScore: scores?[.idCardBack].map { TwoDecimalFloat($0) },
            frontCardScore: scores?[.idCardFront].map { TwoDecimalFloat($0) },
            highResImage: highResImage,
            invalidScore: scores?[.invalid].map { TwoDecimalFloat($0) },
            lowResImage: lowResImage,
            passportScore: scores?[.passport].map { TwoDecimalFloat($0) },
            uploadMethod: uploadMethod,
            _additionalParametersStorage: nil
        )
    }
}
