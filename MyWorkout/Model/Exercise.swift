//
//  Exercise.swift
//  MyWorkout
//
//  Created by Nattapong Chaowhacharoenpong on 19/9/2564 BE.
//

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: CustomStringConvertible {
        //example exercise
        case squat
        case stepUp
        case burpee
        case sunSalute
        //additional exercise
        case plank
        case jumpLunge
        case scissorKicks
        
        var description: String {
            switch self {
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
            case .jumpLunge:
                return NSLocalizedString("Jump Lunge", comment: "exercise")
            case .plank:
                return NSLocalizedString("Plank", comment: "exercise")
            case .scissorKicks:
                return NSLocalizedString("Scissor Kicks", comment: "exercise")
            case .sunSalute:
                return NSLocalizedString("Sun Salute", comment: "exercise")
            }
        }
    }
    
    
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: String(describing: ExerciseEnum.squat), videoName: "squat"),
        Exercise(exerciseName: String(describing: ExerciseEnum.stepUp), videoName: "step-up"),
        Exercise(exerciseName: String(describing: ExerciseEnum.burpee), videoName: "burpee"),
        Exercise(exerciseName: String(describing: ExerciseEnum.sunSalute), videoName: "sun-salute"),
        Exercise(exerciseName: String(describing: ExerciseEnum.plank), videoName: "plank"),
        Exercise(exerciseName: String(describing: ExerciseEnum.jumpLunge), videoName: "jump-lunge"),
        Exercise(exerciseName: String(describing: ExerciseEnum.scissorKicks), videoName: "scissor-kicks")
    ]
}
